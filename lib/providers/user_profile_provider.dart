import 'dart:io';
import 'package:flutter/material.dart';

class UserProfileProvider with ChangeNotifier {
  // Private fields
  String _userName = 'Default User';
  String _userEmail = 'user@example.com';
  File? _userImage;
  bool _notificationsOn = true;

  // Getters
  String get userName => _userName;
  String get userEmail => _userEmail;
  File? get userImage => _userImage;
  bool get notificationsOn => _notificationsOn;

  // Setters with notifyListeners to update UI
  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void setUserEmail(String email) {
    _userEmail = email;
    notifyListeners();
  }

  void setUserImage(File image) {
    _userImage = image;
    notifyListeners();
  }

  void toggleNotifications(bool value) {
    _notificationsOn = value;
    notifyListeners();
  }
}
