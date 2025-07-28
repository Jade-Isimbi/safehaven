import 'package:flutter/material.dart';
import '../../../menu/presentation/pages/menu_page.dart';

class MenuSearchBar extends StatelessWidget {
  const MenuSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search something...",
        hintStyle: TextStyle(color: Colors.pink[200]),
        prefixIcon: IconButton(
          icon: Icon(Icons.search, color: Colors.pink[200]),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const MenuPage()),
            );
          },
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
} 