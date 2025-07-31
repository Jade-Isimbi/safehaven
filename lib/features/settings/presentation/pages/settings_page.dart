import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../shared/widgets/custom_bottom_navigation_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  XFile? _userImage;
  bool _notificationsOn = true;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _userImage = pickedFile);
    }
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  Widget buildListTile({
    required Widget leadingIcon,
    required String title,
    TextStyle? titleSyle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: leadingIcon,
      ),
      title: Text(
        title,
        style: titleSyle ?? const TextStyle(fontSize: 16),
      ),
      trailing: trailing ?? 
      const Icon(
        Icons.chevron_right,
        color: Color(0xFF9E182B),
        size: 32,
      ),
      onTap: onTap,
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Profile Image with Edit Button
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 206,
                      height: 206,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey,
                        border: Border.all(
                          color: Color(0xFFF2AFBC),
                          width: 4.0
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: _userImage != null
                              ?FileImage(File(_userImage!.path))
                              : const AssetImage('assets/images/Profile.png') as ImageProvider,
                        ),
                      ),
                      
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.add, color: Color(0XFF9E182B), size: 32),
                        ),
                      ),
                    ),
                  ],

                ),
              ),


              const SizedBox(height: 20),

              // Settings Sections
              Padding(
                padding: const EdgeInsets.all(23.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5DC),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color(0xFFF2AFBC),
                      width: 4.0,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Account Section
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),


                      buildListTile(
                        leadingIcon: Image.asset('assets/images/user2.png'),
                        title: 'Edit Profile',
                        titleSyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700
                        )
                      ),

                      const SizedBox(height: 15),

                      buildListTile(
                        leadingIcon: Image.asset('assets/images/Shield.png'),
                        title: 'Security',
                        titleSyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700
                        ),
                      ),

                      const SizedBox(height: 15),

                      buildListTile(
                        leadingIcon: Image.asset('assets/images/lock2.png'),
                        title: 'Privacy',
                        titleSyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700
                        ),
                      ),

                      const SizedBox(height: 15),

                      buildListTile(
                        leadingIcon: Image.asset('assets/images/Bell.png'),
                        title: 'Notifications',
                        titleSyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700
                        ),
                        trailing: Switch(
                          value: _notificationsOn,
                          onChanged: (val) {
                            setState(() => _notificationsOn = val);
                          },
                          activeColor: Color(0xFF9E182B),
                          activeTrackColor: Color(0xFFF2AFBC),
                          inactiveTrackColor: Color(0xFFF5F5DC),
                          inactiveThumbColor: Color(0xFF9E182B),
                        )
                      ),

                      const SizedBox(height: 25),

                      // Support & About 
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Support & About',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                          )
                        ),
                      ),

                      buildListTile(
                        leadingIcon: Image.asset('assets/images/Alert_circle.png'),
                        title: 'Terms & Conditions',
                        titleSyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      const SizedBox(height: 15),

                      buildListTile(
                        leadingIcon: Image.asset('assets/images/Help_circle.png'),
                        title: 'Help & Support',
                        titleSyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700
                        ),
                      ),

                      const SizedBox(height: 28),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 80), // space above bottom nav
            ],
          ),
        ),
      ),

      //bootom navigtaion bar
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 3),
    );
  }
}
