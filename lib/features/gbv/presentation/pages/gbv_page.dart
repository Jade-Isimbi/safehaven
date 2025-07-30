import 'package:flutter/material.dart';
import '../../../../shared/widgets/custom_bottom_navigation_bar.dart';

class GbvPage extends StatelessWidget {
  const GbvPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3E7), // Light cream background
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F3E7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Understanding GBV',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),