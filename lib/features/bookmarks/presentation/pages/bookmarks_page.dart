import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared/widgets/logout_button.dart';
import '../../../../shared/widgets/custom_bottom_navigation_bar.dart';
import '../providers/bookmark_provider.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  @override
  void initState() {
    super.initState();
    // Load bookmarks when the page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BookmarkProvider>().loadUserBookmarks();
    });
  }

  String _getTypeDisplayName(String type) {
    switch (type) {
      case 'educationalContent':
        return 'Educational Content';
      case 'copingTool':
        return 'Coping Tools';
      case 'support':
        return 'Support Services';
      case 'rights':
        return 'Legal Rights';
      default:
        return 'Other';
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'educationalContent':
        return Icons.school;
      case 'copingTool':
        return Icons.psychology;
      case 'support':
        return Icons.support_agent;
      case 'rights':
        return Icons.gavel;
      default:
        return Icons.bookmark;
    }
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
                    'My Bookmarks',
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
                  'Your saved content and resources.',
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
              child: Consumer<BookmarkProvider>(
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
                            'Error loading bookmarks',
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
                              provider.loadUserBookmarks();
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

                  final bookmarks = provider.bookmarks;
                  
                  if (bookmarks.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bookmark_border,
                            size: 64,
                            color: Color(0xFF9E182B),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No bookmarks yet',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9E182B),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Start bookmarking content to see it here',
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
                      itemCount: bookmarks.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final bookmark = bookmarks[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Color(0xFFF2AFBC), width: 1.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.pink.withValues(alpha: 0.08),
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
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF2AFBC),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        _getTypeIcon(bookmark.type),
                                        color: Color(0xFF9E182B),
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            bookmark.title.isNotEmpty ? bookmark.title : 'Untitled',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF2D1E2F),
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            _getTypeDisplayName(bookmark.type),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFFB05A7A),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.bookmark,
                                        color: Color(0xFF9E182B),
                                      ),
                                      onPressed: () {
                                        provider.removeBookmark(
                                          itemId: bookmark.itemId,
                                          type: bookmark.type,
                                        );
                                      },
                                      tooltip: 'Remove bookmark',
                                    ),
                                  ],
                                ),
                                if (bookmark.description.isNotEmpty) ...[
                                  const SizedBox(height: 12),
                                  Text(
                                    bookmark.description,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF2D1E2F),
                                      height: 1.4,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                                const SizedBox(height: 8),
                                Text(
                                  'Bookmarked on ${_formatDate(bookmark.createdAt)}',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFFB05A7A),
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
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
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 3),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
} 