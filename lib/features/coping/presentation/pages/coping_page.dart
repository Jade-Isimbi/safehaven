import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared/widgets/logout_button.dart';
import '../../../../shared/widgets/custom_bottom_navigation_bar.dart';
import '../providers/coping_tool_provider.dart';
import '../../data/models/coping_tool_model.dart';
import '../../../bookmarks/presentation/providers/bookmark_provider.dart';



class CopingPage extends StatefulWidget {
  const CopingPage({super.key});

  @override
  State<CopingPage> createState() => _CopingPageState();
}

class _CopingPageState extends State<CopingPage> {
  @override
  void initState() {
    super.initState();
    // Load coping tools when the page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CopingToolProvider>().loadCopingTools();
    });
  }

  void _openTool(BuildContext context, CopingToolModel tool) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          tool.title,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            color: Color(0xFF9E182B),
          ),
        ),
        content: Text(
          tool.content,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: Color(0xFF2D1E2F),
            height: 1.5,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Close',
              style: TextStyle(color: Color(0xFF9E182B)),
            ),
          ),
        ],
      ),
    );
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
                    'Coping & Mental Health Tools',
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
                  'Tools and techniques for mental wellness and healing.',
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
              child: Consumer<CopingToolProvider>(
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
                            'Error loading coping tools',
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
                              provider.loadCopingTools();
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

                  final copingTools = provider.copingTools;
                  
                  if (copingTools.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.psychology_outlined,
                            size: 64,
                            color: Color(0xFF9E182B),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No coping tools available',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9E182B),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Check back later for new tools',
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
                      itemCount: copingTools.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final tool = copingTools[index];
                        return Consumer<BookmarkProvider>(
                          builder: (context, bookmarkProvider, child) {
                            return FutureBuilder<bool>(
                              future: bookmarkProvider.isBookmarked(
                                itemId: tool.id,
                                type: 'copingTool',
                              ),
                              builder: (context, snapshot) {
                                final isBookmarked = snapshot.data ?? false;
                                
                                return GestureDetector(
                                  onTap: () => _openTool(context, tool),
                                  child: Container(
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
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  tool.title.isNotEmpty ? tool.title : 'Untitled',
                                                  style: const TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF2D1E2F),
                                                  ),
                                                ),
                                                if (tool.description.isNotEmpty) ...[
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    tool.description,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFFB05A7A),
                                                    ),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                                if (tool.type.isNotEmpty) ...[
                                                  const SizedBox(height: 4),
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF2AFBC),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    child: Text(
                                                      tool.type,
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xFF9E182B),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 56,
                                          width: 56,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2AFBC),
                                            borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(16),
                                              bottomRight: Radius.circular(16),
                                            ),
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                                              color: isBookmarked ? Color(0xFF9E182B) : Color(0xFF9E182B),
                                              size: 28,
                                            ),
                                            onPressed: () {
                                              bookmarkProvider.toggleBookmark(
                                                itemId: tool.id,
                                                title: tool.title,
                                                description: tool.description,
                                                type: 'copingTool',
                                              );
                                            },
                                            tooltip: isBookmarked ? 'Remove Bookmark' : 'Bookmark',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
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
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}
