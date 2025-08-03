import 'package:flutter/material.dart';
import '../../../../shared/widgets/custom_bottom_navigation_bar.dart';
import '../../../../shared/widgets/logout_button.dart';
import '../../../rights/presentation/pages/rights_page.dart';
import '../../../support/presentation/pages/support_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    setState(() {
      // Simulate search results - replace with actual search logic
      if (query.isNotEmpty) {
        _searchResults = [
          'Understanding GBV',
          'Coping & Mental Health tools',
          'Know Your Rights',
          'Support Directory',
          'Gender Based Violence',
          'Mental Health Support',
          'Legal Rights',
          'Emergency Contacts',
        ].where((item) => 
          item.toLowerCase().contains(query.toLowerCase())
        ).toList();
      } else {
        _searchResults = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        leading: const LogoutButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images/app_icon.png'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: TextField(
                controller: _searchController,
                onChanged: _performSearch,
                decoration: InputDecoration(
                  hintText: "Search for resources, rights, support...",
                  hintStyle: TextStyle(color: Colors.pink[200]),
                  prefixIcon: Icon(Icons.search, color: Colors.pink[200]),
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.9),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.pink[200]!, width: 2),
                  ),
                ),
              ),
            ),
            // Search Results
            Expanded(
              child: _searchController.text.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            size: 64,
                            color: Colors.pink[200],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Search for resources',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.pink[300],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Find rights, support, and helpful information',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.pink[200],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.pink[100]!, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.pink.withValues(alpha: 0.08),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              _searchResults[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xFF2D1E2F),
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.pink[200],
                              size: 16,
                            ),
                            onTap: () {
                              // Navigate to appropriate page based on search result
                              if (_searchResults[index].contains('Rights')) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => RightsPage(),
                                  ),
                                );
                              } else if (_searchResults[index].contains('Support')) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SupportPage(),
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
    );
  }
} 