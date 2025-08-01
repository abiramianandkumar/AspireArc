from flask import Flask, request, jsonify
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
import nltk
import pytesseract  # OCR library
from sklearn.metrics.pairwise import cosine_similarity
import os

app = Flask(__name__)

# Download NLTK resources (comment out if already downloaded)
nltk.download('punkt')
nltk.download('stopwords')

# Define stop words and stemmer
stop_words = set(stopwords.words('english'))
stemmer = PorterStemmer()

# Function to clean text data
def clean_text(text):
    text = text.lower()  # lowercase
    text = nltk.word_tokenize(text)  # tokenize
    text = [word for word in text if word not in stop_words]  # remove stop words
    text = [stemmer.stem(word) for word in text]  # stemming
    return " ".join(text)

# Function to extract text from resume image using OCR
def extract_text_from_image(image_path):
    # Ensure Tesseract OCR is installed and accessible in your system path
    pytesseract.pytesseract.tesseract_cmd = r"C:\Program Files\Tesseract-OCR\tesseract.exe"
    text = pytesseract.image_to_string(image_path)
    return text

# Function to extract skills from resume
def extract_skills(resume_text):
    cleaned_resume = clean_text(resume_text)
    # Implement logic to identify skills from resume text (e.g., regular expressions)
    # Here's a simplified example, replace with your actual skill extraction logic
    skills = [word for word in cleaned_resume.split() if word.startswith("skill")]
    return skills

# Load job data
data = pd.read_csv('C:/Users/abira/Downloads/archive (6)/final_job_list.csv')

# Clean job descriptions and identified skills
data["Job Description"] = data["Job Description"].apply(clean_text)
data["Identified_Skills"] = data["Identified_Skills"].apply(clean_text)

# Combine job descriptions and skills for better representation
data["text_content"] = data["Job Description"] + " " + data["Identified_Skills"]

# One-hot encode categorical features (if applicable)
data_encoded = pd.get_dummies(data, columns=["Type of Positions", "Location"])

# Create TF-IDF vectorizer
vectorizer = TfidfVectorizer()

# Transform text data into TF-IDF vectors
tfidf_matrix = vectorizer.fit_transform(data_encoded["text_content"])

# Function to recommend jobs based on a user resume image and location preference
def recommend_jobs(user_resume_image, user_location, top_n=5):
    # Extract text from resume image using OCR
    resume_text = extract_text_from_image(user_resume_image)
    # Extract skills from user resume
    user_skills = extract_skills(resume_text)
    user_profile = " ".join(user_skills)
    user_vector = vectorizer.transform([clean_text(user_profile)])

    # Calculate cosine similarity between user and all jobs
    similarities = cosine_similarity(user_vector, tfidf_matrix)

    # Filter jobs based on user location preference (if provided)
    if user_location:
        location_column = f"Location_{user_location.replace(' ', '_')}"
        if location_column in data_encoded.columns:
            filtered_data = data_encoded[data_encoded[location_column] == 1]
            filtered_indices = filtered_data.index.tolist()
            similarities = similarities[:, filtered_indices]
        else:
            print(f"Location '{user_location}' is not present")
    
    # Sort jobs by similarity (highest first)
    sorted_indices = similarities.argsort()[0, :(-top_n - 1):-1]
   # print(sorted_indices)
    
    # Return top n most similar jobs (titles) with additional info from data_encoded
    if "Location" in data.columns:
        return data[["Title", "Company", "Location"]].iloc[sorted_indices]
    else:
        return data[["Title", "Company"]].iloc[sorted_indices]

@app.route('/')
def index():
    return "Welcome to the Job Recommendation API. Use the /api endpoint to get job recommendations."

@app.route('/favicon.ico')
def favicon():
    return '', 204  # No content response for favicon requests

@app.route('/api', methods=['POST'])
def fun():
    if 'resume' not in request.files:
        return jsonify({"error": "No resume file provided"}), 4002
    
    file = request.files['resume']
    user_location = request.form.get('location', None)
    
    # Save the file to a temporary location
    temp_path = os.path.join("temp", file.filename)
    os.makedirs(os.path.dirname(temp_path), exist_ok=True)
    file.save(temp_path)
    
    # Recommend jobs
    recommendations = recommend_jobs(temp_path, user_location)
    
    # Clean up the temporary file
    os.remove(temp_path)
    
    # Convert recommendations to a list of dictionaries
    recommendations_list = recommendations.to_dict(orient='records')
    
    return jsonify(recommendations_list), 200

if __name__ == '__main__':
    app.run(debug=True)
