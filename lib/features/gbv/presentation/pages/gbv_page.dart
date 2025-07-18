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
                children: [
                  _buildMenuCard(context, 'Signs of GBV', false, () {}),
                  SizedBox(height: screenHeight * 0.02),
                  _buildMenuCard(context, 'Types of GBV', false, () {}),
                  SizedBox(height: screenHeight * 0.02),
                  _buildMenuCard(context, 'Impact of GBV', false, () {}),
                  SizedBox(height: screenHeight * 0.02),
                  _buildMenuCard(context, 'Help a Victim', true, () {
                    Navigator.pushNamed(context, '/help-victim');
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    bool isSelected,
    VoidCallback onTap,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.pink.shade200, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            Icon(
              isSelected ? Icons.bookmark : Icons.bookmark_border,
              color: isSelected ? Colors.black : Colors.grey,
              size: screenWidth * 0.06,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: Colors.pink, size: screenWidth * 0.07),
          Icon(Icons.search, color: Colors.grey, size: screenWidth * 0.07),
          Icon(Icons.add, color: Colors.grey, size: screenWidth * 0.07),
          Icon(
            Icons.notifications,
            color: Colors.grey,
            size: screenWidth * 0.07,
          ),
          Icon(Icons.settings, color: Colors.grey, size: screenWidth * 0.07),
        ],
      ),
    );
  }
}
