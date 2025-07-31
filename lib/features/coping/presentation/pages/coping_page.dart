import 'package:flutter/material.dart';

class CopingPage extends StatefulWidget {
  const CopingPage({Key? key}) : super(key: key);

  @override
  State<CopingPage> createState() => _CopingPageState();
}

class _CopingPageState extends State<CopingPage> {
  final List<_CopingTool> _tools = [
    _CopingTool(
      title: 'PTSD, anxiety, explained',
      content: 'Learn about PTSD and anxiety, their symptoms, and how to manage them.\n\nTips:\n- Practice mindfulness\n- Seek support\n- Maintain a healthy routine',
    ),
    _CopingTool(
      title: 'Grounding exercises',
      content: 'Grounding exercises help you stay present.\n\nTry this:\n- 5 things you can see\n- 4 things you can touch\n- 3 things you can hear\n- 2 things you can smell\n- 1 thing you can taste',
    ),
    _CopingTool(
      title: 'self-care routines',
      content: 'Self-care is essential for mental health.\n\nIdeas:\n- Take a walk\n- Journal your thoughts\n- Listen to music\n- Connect with friends',
    ),
    _CopingTool(
      title: 'Self-assessment checklists',
      content: 'Check in with yourself regularly.\n\nChecklist:\n- How am I feeling today?\n- What do I need right now?\n- Who can I reach out to for support?',
    ),
  ];

  final Set<int> _bookmarked = {};

  void _toggleBookmark(int index) {
    setState(() {
      if (_bookmarked.contains(index)) {
        _bookmarked.remove(index);
      } else {
        _bookmarked.add(index);
      }
    });
  }

  void _openTool(BuildContext context, _CopingTool tool) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tool.title, style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.bold)),
        content: Text(tool.content, style: const TextStyle(fontFamily: 'Inter')),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/app_icon.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFF2AFBC),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    'Coping and Mental\nhealth Tools',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF9E182B),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _tools.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final tool = _tools[index];
                  final isBookmarked = _bookmarked.contains(index);
                  return GestureDetector(
                    onTap: () => _openTool(context, tool),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFF2AFBC), width: 2),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16),
                              child: Text(
                                tool.title,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  color: Color(0xFF9E182B),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                              color: Color(0xFFF2AFBC),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(
                                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                                color: isBookmarked ? Color(0xFF9E182B) : Color(0xFF9E182B),
                                size: 28,
                              ),
                              onPressed: () => _toggleBookmark(index),
                              tooltip: isBookmarked ? 'Remove Bookmark' : 'Bookmark',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Bottom navigation bar placeholder (if needed)
            // ...
          ],
        ),
      ),
    );
  }
}

class _CopingTool {
  final String title;
  final String content;
  _CopingTool({required this.title, required this.content});
}