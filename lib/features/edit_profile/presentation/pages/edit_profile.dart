import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../shared/widgets/custom_bottom_navigation_bar.dart';
import '../../../../providers/user_profile_provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  XFile? _newImage;

  @override
  void initState() {
    super.initState();
    final userProfile = Provider.of<UserProfileProvider>(context, listen: false);
    _nameController = TextEditingController(text: userProfile.userName);
    _emailController = TextEditingController(text: userProfile.userEmail);
  }

  Future<void> _pickNewImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _newImage = picked);
    }
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      final profileProvider = Provider.of<UserProfileProvider>(context, listen: false);
      profileProvider.setUserName(_nameController.text);
      profileProvider.setUserEmail(_emailController.text);
      if (_newImage != null) profileProvider.setUserImage(_newImage! as File);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<UserProfileProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xFFF5F5DC),
        
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Profile image
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFF2AFBC), width: 4),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: _newImage != null
                            ? FileImage(File(_newImage!.path))
                            : userProfile.userImage != null
                                ? FileImage(File(userProfile.userImage!.path))
                                : const AssetImage('assets/images/Profile.png') as ImageProvider,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Color(0xFF9E182B)),
                    onPressed: _pickNewImage,
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Name field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty ? 'Enter your name' : null,
              ),
              const SizedBox(height: 20),

              // Email field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter your email';
                  if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(value)) return 'Invalid email';
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Save button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9E182B),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('Save', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}
