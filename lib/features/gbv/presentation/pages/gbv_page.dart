import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared/widgets/custom_bottom_navigation_bar.dart';
import '../../../../shared/widgets/logout_button.dart';
import '../providers/educational_content_provider.dart';
import 'helpvictim_page.dart';
import 'signs_gbv_page.dart';
import 'educational_content_detail_page.dart';

class GbvPage extends StatefulWidget {
  const GbvPage({super.key});

  @override
  State<GbvPage> createState() => _GbvPageState();
}

class _GbvPageState extends State<GbvPage> {
  @override
  void initState() {
    super.initState();
    // Load educational content when the page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EducationalContentProvider>().loadEducationalContent();
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
                    'Understanding GBV',
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
                  'Education and awareness about gender-based violence.',
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
              child: Consumer<EducationalContentProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF9E182B),
                      ),
                    );
                  }

                  if (provider.error != null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 64,
                            color: Color(0xFF9E182B),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Error loading content',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9E182B),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            provider.error!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFB05A7A),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              provider.loadEducationalContent();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF9E182B),
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  final educationalContent = provider.educationalContent;
                  
                  if (educationalContent.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book_outlined,
                            size: 64,
                            color: Color(0xFF9E182B),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No educational content available',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9E182B),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Check back later for new content',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFB05A7A),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListView.separated(
                      itemCount: educationalContent.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final content = educationalContent[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EducationalContentDetailPage(
                                  contentId: content.id,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Color(0xFFF2AFBC), width: 1.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.pink.withOpacity(0.08),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          content.title.isNotEmpty ? content.title : 'Untitled',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF9E182B),
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                      ),
                                      if (content.language.isNotEmpty)
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2AFBC),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            content.language,
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF9E182B),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  if (content.description.isNotEmpty) ...[
                                    const SizedBox(height: 8),
                                    Text(
                                      content.description,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF2D1E2F),
                                        height: 1.4,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                        color: Color(0xFF9E182B),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Read more',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF9E182B),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentIndex: 0, // Set home as active since we're in the app
      ),
    );
  }


}
