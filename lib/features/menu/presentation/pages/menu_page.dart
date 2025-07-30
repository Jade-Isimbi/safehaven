import 'package:flutter/material.dart';
import '../widgets/menu_search_bar.dart';
import '../widgets/menu_card.dart';
import '../../../rights/presentation/pages/rights_page.dart';
import '../../../coping/presentation/pages/coping_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8E4),
      body: SafeArea(
        child: Column(
          children: [
            // Top Row: Search Bar + Avatar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Expanded(child: MenuSearchBar()),
                  const SizedBox(width: 12),
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                ],
              ),
            ),
            // Menu Cards
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  const MenuCard(title: "Understanding GBV", label: "Education"),
                  const SizedBox(height: 16),
                  MenuCard(
                    title: "Coping & Mental Health tools",
                    label: "Wellness",
                    onTap: () {
                      Navigator.of(context).pushNamed('/coping');
                    },
                  ),
                  const SizedBox(height: 16),
                  MenuCard(
                    title: "Know Your Rights",
                    label: "Legal",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RightsPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  const MenuCard(title: "Support Directory", label: "Contacts"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.pink[300],
        unselectedItemColor: Colors.pink[100],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
    );
  }
} 