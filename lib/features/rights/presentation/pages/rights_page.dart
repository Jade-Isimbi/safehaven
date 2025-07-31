import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../menu/presentation/pages/menu_page.dart';
import '../providers/rights_provider.dart';
import '../../data/models/right_model.dart';
import '../../../../shared/widgets/custom_bottom_navigation_bar.dart';
import '../../../../shared/widgets/logout_button.dart';

class RightsPage extends StatefulWidget {
  const RightsPage({super.key});

  @override
  State<RightsPage> createState() => _RightsPageState();
}

class _RightsPageState extends State<RightsPage> {
  @override
  void initState() {
    super.initState();
    // Load rights when the page is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RightsProvider>().loadRights();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
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
              child: Consumer<RightsProvider>(
                builder: (context, rightsProvider, child) {
                  if (rightsProvider.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFB05A7A),
                      ),
                    );
                  }

                  if (rightsProvider.error != null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 64,
                            color: Colors.pink[200],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Error loading rights',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.pink[300],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            rightsProvider.error!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.pink[200],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => rightsProvider.loadRights(),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  if (rightsProvider.rights.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 64,
                            color: Colors.pink[200],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No rights found',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.pink[300],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Add rights to your Firestore collection',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.pink[200],
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: rightsProvider.rights.length,
                    itemBuilder: (context, index) {
                      final right = rightsProvider.rights[index];
                      return _RightCard(
                        right: right,
                        onTap: () => _showRightDetails(context, right),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
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

  void _showRightDetails(BuildContext context, RightModel right) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(right.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${right.description}'),
            const SizedBox(height: 8),
            Text('Content: ${right.content}'),
            if (right.hasUrl) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text('Link: '),
                  ),
                  Expanded(
                    flex: 2,
                    child: _buildClickableUrl(context, right.url!),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 8),
            Text('Region: ${right.region}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildClickableUrl(BuildContext context, String url) {
    if (_isValidUrl(url)) {
      return GestureDetector(
        onTap: () => _launchUrl(context, url),
        child: Text(
          url,
          style: const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    } else {
      return Text(url);
    }
  }

  bool _isValidUrl(String url) {
    return url.startsWith('http://') || url.startsWith('https://');
  }

  Future<void> _launchUrl(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // Show error if URL cannot be launched
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not open: $url'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

class _RightCard extends StatelessWidget {
  final RightModel right;
  final VoidCallback onTap;
  
  const _RightCard({required this.right, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
          right.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xFF2D1E2F),
          ),
        ),
        subtitle: Text(
          right.description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
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
        onTap: onTap,
      ),
    );
  }
} 