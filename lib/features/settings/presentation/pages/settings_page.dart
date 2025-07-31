import 'package:flutter/material.dart';
import '../../../../shared/widgets/logout_button.dart';
import '../../../../shared/widgets/custom_bottom_navigation_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        leading: const LogoutButton(),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFF9E182B),
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images/app_icon.png'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Kotta One',
                  color: Color(0xFF9E182B),
                ),
              ),
              const SizedBox(height: 20),
              // Add settings options here
              ListTile(
                leading: Icon(Icons.person, color: Color(0xFF9E182B)),
                title: Text('Profile Settings', style: TextStyle(fontFamily: 'Inter')),
                onTap: () {
                  // TODO: Navigate to profile settings
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications, color: Color(0xFF9E182B)),
                title: Text('Notifications', style: TextStyle(fontFamily: 'Inter')),
                onTap: () {
                  // TODO: Navigate to notification settings
                },
              ),
              ListTile(
                leading: Icon(Icons.security, color: Color(0xFF9E182B)),
                title: Text('Privacy & Security', style: TextStyle(fontFamily: 'Inter')),
                onTap: () {
                  // TODO: Navigate to privacy settings
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 3),
    );
  }
} 