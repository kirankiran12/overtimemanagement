import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _phone = '';
  String _address = '';
  File? _profilePicture;

  final ImagePicker _picker = ImagePicker();

  final Map<String, dynamic> _userData = {
    'name': 'sir',
    'email': 'codethinker@example.com',
    'phone': '0300-456-7890',
    'address': '123 Main St, City, Country',
    'profilePicture': null,
  };

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  void _loadUserProfile() {
    setState(() {
      _name = _userData['name'];
      _email = _userData['email'];
      _phone = _userData['phone'];
      _address = _userData['address'];
      if (_userData['profilePicture'] != null) {
        _profilePicture = File(_userData['profilePicture']);
      }
    });
  }

  void _saveUserProfile() {
    setState(() {
      _userData['name'] = _name;
      _userData['email'] = _email;
      _userData['phone'] = _phone;
      _userData['address'] = _address;
      if (_profilePicture != null) {
        _userData['profilePicture'] = _profilePicture!.path;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile updated successfully!')),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _profilePicture = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Color(0xFF0A65FC),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Text(
              'User Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.07,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xFF0A65FC),
                              radius: width * 0.15,
                              backgroundImage: _profilePicture != null
                                  ? FileImage(_profilePicture!)
                                  : AssetImage('assets/placeholder.png')
                                      as ImageProvider,
                            ),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF0A65FC)),
                                  onPressed: () =>
                                      _pickImage(ImageSource.gallery),
                                  child: Text(
                                    'Pick from Gallery',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF0A65FC)),
                                  onPressed: () =>
                                      _pickImage(ImageSource.camera),
                                  child: Text(
                                    'Capture from Camera',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                initialValue: _name,
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _name = value!,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                initialValue: _email,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _email = value!,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                initialValue: _phone,
                                decoration: InputDecoration(
                                  labelText: 'Phone',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _phone = value!,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                initialValue: _address,
                                decoration: InputDecoration(
                                  labelText: 'Address',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your address';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _address = value!,
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF0A65FC)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    _saveUserProfile();
                                  }
                                },
                                child: Text(
                                  'Update Profile',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
