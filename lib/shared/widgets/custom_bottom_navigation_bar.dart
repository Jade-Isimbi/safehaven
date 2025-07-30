import 'package:flutter/material.dart';
import '../../features/menu/presentation/pages/menu_page.dart';
import '../../features/search/presentation/pages/search_page.dart';
import '../../features/rating/rating_page.dart';

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
        } else if (index == 1) {
          // Navigate to search page when search icon is tapped
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SearchPage()),
          );
        } else if (index == 2) {
          // Navigate to rating page when star icon is tapped
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const RatingPage()),
          );
        }
        // Call the original onTap callback if provided
        onTap?.call(index);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
      ],
    );
  }
} 