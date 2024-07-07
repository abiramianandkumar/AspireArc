// ignore_for_file: depend_on_referenced_packages, prefer_final_fields, prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:io';

import 'package:aspire_arc/components/button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Job extends StatefulWidget {
  const Job({super.key});

  @override
  State<Job> createState() => _HomeState();
}

class _HomeState extends State<Job> {
  File? _image;
  TextEditingController _locationController = TextEditingController();
  List<dynamic> _jobRecommendations = [];

  Future<File?> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }

  Future<void> uploadImage(File image, String? location) async {
    final uri = Uri.parse('http://10.0.2.2:5000/api'); // Ensure Flask server is accessible
    final request = http.MultipartRequest('POST', uri);

    request.files.add(await http.MultipartFile.fromPath('resume', image.path));

    if (location != null) {
      request.fields['location'] = location;
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final data = jsonDecode(responseBody);
      setState(() {
        _jobRecommendations = data;
      });
      print('Job Recommendations: $data');
    } else {
      print('Failed to upload image: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(_image == null )...[ Center(
                child: MyButton(onTap: () async {
                  final image = await pickImage();
                  setState(() {
                    _image = image;
                  });
                }, text: 'Pick Resume Image'),
              ),],
                
              
             
             
              if (_image != null) ...[
                Image.file(_image!, height: 200),
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Enter Location'),
                ),
                ElevatedButton(
                  onPressed: () {
                    uploadImage(_image!, _locationController.text);
                  },
                  child: Text('Upload Image and Get Recommendations'),
                ),
              ],
              Expanded(
                child: _jobRecommendations.isEmpty
                    ? Text('No job recommendations yet.')
                    : ListView.builder(
                        itemCount: _jobRecommendations.length,
                        itemBuilder: (context, index) {
                          return Container(
                           
                            child: ListTile(
                              title: Text(_jobRecommendations[index]['Title']),
                              subtitle: Text(_jobRecommendations[index]['Company']),
                              trailing: Text(_jobRecommendations[index]['Location']),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



