import 'package:flutter/material.dart';

class GbvPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5DC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.brown.shade300,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(
          'Understanding GBV',
          style: TextStyle(
            color: Colors.pink.shade300,
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
  padding: EdgeInsets.symmetric(
    horizontal: screenWidth * 0.05,
    vertical: screenHeight * 0.02,
  ),
  child: Column(
    children: [
      Expanded(
        child: ListView(
          children: [],
        ),
      ),
    ],
  ),
),
    );
  }
}
