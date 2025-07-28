import 'package:flutter/material.dart';
import '../../../menu/presentation/pages/menu_page.dart';

class RightsPage extends StatelessWidget {
  const RightsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8E4),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          'Know Your Rights',
                          style: TextStyle(
                            color: Color(0xFFB05A7A),
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Center(
                child: Text(
                  'Everyone has the right to live free from\nviolence and fear.',
                  style: TextStyle(
                    color: Color(0xFFB05A7A),
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  _RightCard(title: 'Right to safety'),
                  const SizedBox(height: 16),
                  _RightCard(title: 'Right to report GBV'),
                  const SizedBox(height: 16),
                  _RightCard(title: 'Right to support'),
                  const SizedBox(height: 16),
                  _RightCard(title: 'Right to Legal Help'),
                  const SizedBox(height: 16),
                  _RightCard(title: 'Right to Confidentiality'),
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
        onTap: (index) {
          if (index == 1) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MenuPage()),
            );
          }
        },
      ),
    );
  }
}

class _RightCard extends StatelessWidget {
  final String title;
  const _RightCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.pink[100]!, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xFF2D1E2F),
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            color: Colors.pink[50],
            shape: BoxShape.circle,
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.info_outline, color: Color(0xFFB05A7A)),
          ),
        ),
        onTap: () {}, // Optionally show more info
      ),
    );
  }
} 