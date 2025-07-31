import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared/widgets/logout_button.dart';
import '../../../../shared/widgets/custom_bottom_navigation_bar.dart';
import '../providers/educational_content_provider.dart';
import '../../../bookmarks/presentation/providers/bookmark_provider.dart';

class EducationalContentDetailPage extends StatefulWidget {
  final String contentId;
  
  const EducationalContentDetailPage({
    Key? key,
    required this.contentId,
  }) : super(key: key);

  @override
  State<EducationalContentDetailPage> createState() => _EducationalContentDetailPageState();
}

class _EducationalContentDetailPageState extends State<EducationalContentDetailPage> {
  @override
  void initState() {
    super.initState();
    // Load the educational content when the page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EducationalContentProvider>().loadEducationalContentById(widget.contentId);
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
      body: Consumer<EducationalContentProvider>(
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
                      provider.loadEducationalContentById(widget.contentId);
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

          final content = provider.selectedContent;
          if (content == null) {
            return const Center(
              child: Text(
                'Content not found',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF9E182B),
                ),
              ),
            );
          }

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Container
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          content.title.isNotEmpty ? content.title : 'Untitled',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9E182B),
                            fontFamily: 'Inter',
                          ),
                        ),
                        const SizedBox(height: 8),
                        
                        // Language Badge
                        if (content.language.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Color(0xFFF2AFBC),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              content.language,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF9E182B),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Description Section
                  if (content.description.isNotEmpty) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFF2AFBC), width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.description,
                                color: Color(0xFF9E182B),
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF9E182B),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            content.description,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF2D1E2F),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  
                  // Content Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xFFF2AFBC), width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.article,
                              color: Color(0xFF9E182B),
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Content',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF9E182B),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          content.content.isNotEmpty ? content.content : 'No content available',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF2D1E2F),
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Bookmark Button
                  Consumer<BookmarkProvider>(
                    builder: (context, bookmarkProvider, child) {
                      return FutureBuilder<bool>(
                        future: bookmarkProvider.isBookmarked(
                          itemId: content.id,
                          type: 'educationalContent',
                        ),
                        builder: (context, snapshot) {
                          final isBookmarked = snapshot.data ?? false;
                          
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                bookmarkProvider.toggleBookmark(
                                  itemId: content.id,
                                  title: content.title,
                                  description: content.description,
                                  type: 'educationalContent',
                                );
                                
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      isBookmarked ? 'Removed from bookmarks' : 'Added to bookmarks',
                                    ),
                                    backgroundColor: Color(0xFF9E182B),
                                  ),
                                );
                              },
                              icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border),
                              label: Text(isBookmarked ? 'Remove Bookmark' : 'Bookmark'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isBookmarked ? Color(0xFFF2AFBC) : Color(0xFF9E182B),
                                foregroundColor: isBookmarked ? Color(0xFF9E182B) : Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
    );
  }
} 