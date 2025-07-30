import 'package:flutter/material.dart';
import '../../features/menu/presentation/pages/menu_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const CustomBottomNavigationBar({
    super.key,
    this.currentIndex = 1,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.pink[300],
      unselectedItemColor: Colors.pink[100],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        if (index == 0) {
          // Navigate to menu page when home icon is tapped
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MenuPage()),
          );
        }
        // Call the original onTap callback if provided
        onTap?.call(index);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
      ],
    );
  }
} 