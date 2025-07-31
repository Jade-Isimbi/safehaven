import 'package:flutter/material.dart';
import '../widgets/menu_card.dart';
import '../../../rights/presentation/pages/rights_page.dart';
import '../../../coping/presentation/pages/coping_page.dart';
import '../../../support/presentation/pages/support_page.dart';
import '../../../gbv/presentation/pages/gbv_page.dart';
import '../../../../shared/widgets/custom_bottom_navigation_bar.dart';
import '../../../../shared/widgets/logout_button.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Row: Logout button and Avatar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LogoutButton(),
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/images/app_icon.png'),
                  ),
                ],
              ),
            ),
            // Menu Cards
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  MenuCard(
                    title: "Understanding GBV",
                    label: "Education",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const GbvPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  MenuCard(
                    title: "Coping & Mental Health tools",
                    label: "Wellness",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CopingPage(),
                        ),
                      );
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
                  MenuCard(
                    title: "Support Directory",
                    label: "Contacts",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SupportPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
    );
  }
} 