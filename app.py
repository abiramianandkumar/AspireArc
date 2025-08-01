from dotenv import load_dotenv
import streamlit as st
import os
from PIL import Image
import pdf2image
import google.generativeai as genai
import io
import base64

# Load environment variables
load_dotenv()

# Configure the GenAI API
genai.configure(api_key=os.getenv('GOOGLE_API_KEY'))

def get_gemini_response(input_text, pdf_content, prompt):
    model = genai.GenerativeModel('gemini-pro-vision')
    response = model.generate_content([input_text, pdf_content[0], prompt])
    return response.text

def process_pdf(file):
    images = pdf2image.convert_from_bytes(file.read())
    first_page = images[0]

    img_byte_arr = io.BytesIO()
    first_page.save(img_byte_arr, format='JPEG')
    img_byte_arr = img_byte_arr.getvalue()
    pdf_parts = [
        {
            'mime_type': 'image/jpeg',
            'data': base64.b64encode(img_byte_arr).decode()
        }
    ]

    return pdf_parts

def process_image(file):
    image = Image.open(file)

    img_byte_arr = io.BytesIO()
    image.save(img_byte_arr, format='JPEG')
    img_byte_arr = img_byte_arr.getvalue()
    img_parts = [
        {
            'mime_type': 'image/jpeg',
            'data': base64.b64encode(img_byte_arr).decode()
        }
    ]

    return img_parts

def process_uploaded_file(file):
    if file.type == "application/pdf":
        return process_pdf(file)
    elif file.type.startswith("image/"):
        return process_image(file)
    else:
        raise ValueError("Unsupported file type")

# Streamlit page configuration
st.set_page_config(page_title='ATS Resume Expert')
st.header('ATS Tracking System')

# User inputs
input_text = st.text_area('Job Description:', key='input')
uploaded_file = st.file_uploader('Upload your resume (PDF or Image)', type=['pdf', 'png', 'jpg', 'jpeg'])

if uploaded_file is not None:
    st.write('File uploaded successfully')

# Action buttons
sub1 = st.button('Tell Me About the Resume')
sub2 = st.button('How can I Improve my Skills')
sub3 = st.button('What are the Keywords that are Missing')
sub4 = st.button('Percentage Match')

input_prompt1 = """
You are an experienced Technical Human Resource Manager. Your task is to review the provided resume against the job description. 
Please share your professional evaluation on whether the candidate's profile aligns with the role. 
Highlight the strengths and weaknesses of the applicant in relation to the specified job requirements.
"""

input_prompt2 = """
You are an experienced career coach. Please review the provided resume and suggest areas for improvement in terms of skills. 
Recommend specific skills and qualifications that the candidate should acquire to better align with the job description.
"""

input_prompt3 = """
You are a skilled ATS (Applicant Tracking System) scanner with a deep understanding of data science and ATS functionality. 
Your task is to evaluate the resume against the provided job description. 
Give me the percentage of match if the resume matches the job description. 
First, the output should come as percentage, then keywords missing, and last final thoughts.
"""

input_prompt4 = """
You are a skilled ATS (Applicant Tracking System) scanner with a deep understanding of data science and ATS functionality. 
Your task is to evaluate the resume against the provided job description. 
Give me the percentage of match if the resume matches the job description. 
Provide a detailed analysis of the resume's strengths and weaknesses in relation to the job description.
"""

# Button actions
if sub1:
    if uploaded_file is not None:
        try:
            file_content = process_uploaded_file(uploaded_file)
            response = get_gemini_response(input_text, file_content, input_prompt1)
            st.subheader("The Response is")
            st.write(response)
        except Exception as e:
            st.write(f"Error: {e}")
    else:
        st.write("Please upload the resume")

elif sub2:
    if uploaded_file is not None:
        try:
            file_content = process_uploaded_file(uploaded_file)
            response = get_gemini_response(input_text, file_content, input_prompt2)
            st.subheader("The Response is")
            st.write(response)
        except Exception as e:
            st.write(f"Error: {e}")
    else:
        st.write("Please upload the resume")

elif sub3:
    if uploaded_file is not None:
        try:
            file_content = process_uploaded_file(uploaded_file)
            response = get_gemini_response(input_text, file_content, input_prompt3)
            st.subheader("The Response is")
            st.write(response)
        except Exception as e:
            st.write(f"Error: {e}")
    else:
        st.write("Please upload the resume")

elif sub4:
    if uploaded_file is not None:
        try:
            file_content = process_uploaded_file(uploaded_file)
            response = get_gemini_response(input_text, file_content, input_prompt4)
            st.subheader("The Response is")
            st.write(response)
        except Exception as e:
            st.write(f"Error: {e}")
    else:
        st.write("Please upload the resume")
