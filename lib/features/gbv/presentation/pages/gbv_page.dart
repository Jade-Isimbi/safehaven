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
           ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.brown.shade300,
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Understanding GBV',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 30),
            
            // Menu Items
            _buildMenuItem(
              context,
              'Signs of GBV',
              Icons.bookmark_border,
              false,
              () {
                // Navigate to Signs of GBV page
              },
            ),
            const SizedBox(height: 16),
            
            _buildMenuItem(
              context,
              'Types of GBV',
              Icons.bookmark_border,
              false,
              () {
                // Navigate to Types of GBV page
              },
            ),
            const SizedBox(height: 16),

            _buildMenuItem(
              context,
              'Impact of GBV',
              Icons.bookmark_border,
              false,
              () {
                // Navigate to Impact of GBV page
              },
            ),
            const SizedBox(height: 16),

            _buildMenuItem(context, 'Help a Victim', Icons.bookmark, true, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpVictimPage()),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentIndex: 0, // Set home as active since we're in the app
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.black : Colors.black87,
                ),
              ),
            ),
            Icon(
              icon,
              color: isSelected ? Colors.black : Colors.grey,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
