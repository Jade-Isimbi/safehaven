import 'package:flutter/material.dart';
import '../../../../shared/widgets/custom_bottom_navigation_bar.dart';

class CopingTool {
  final String title;
  final String content;
  const CopingTool({required this.title, required this.content});
}

final List<CopingTool> _tools = [
  CopingTool(
    title: 'PTSD, anxiety, explained',
    content: '''
Understand what PTSD and anxiety are, and how they affect mental health.

🧠 PTSD (Post-Traumatic Stress Disorder):
- Can result from traumatic events
- May cause flashbacks, nightmares, or emotional numbness

🌬️ Anxiety:
- Feels like racing thoughts, sweating, chest tightness
- Often linked to stress or fear

✨ Tips to manage:
- Practice deep breathing and mindfulness
- Avoid triggers when possible
- Talk to someone you trust or a professional
''',
  ),
  CopingTool(
    title: 'Grounding exercises',
    content: '''
Grounding techniques help you reconnect with the present moment when feeling overwhelmed.

🖐️ Try the 5-4-3-2-1 Method:
- 5 things you can SEE
- 4 things you can TOUCH
- 3 things you can HEAR
- 2 things you can SMELL
- 1 thing you can TASTE

🧘 Additional Grounding Ideas:
- Hold a cold bottle of water and describe how it feels
- Name every object in the room out loud
- Take 10 slow, deep breaths
''',
  ),
  CopingTool(
    title: 'Self-care routines',
    content: '''
Self-care helps you stay mentally and emotionally balanced.

🌅 Morning Routine Ideas:
- Drink a glass of water
- Stretch or take a short walk
- Set one small goal for the day

🌙 Evening Routine Ideas:
- Unplug from screens 30 mins before bed
- Write 3 things you're grateful for
- Listen to calming music

💡 Pro Tip:
Your routine can be small — consistency is more important than perfection.
''',
  ),
  CopingTool(
    title: 'Self-assessment checklists',
    content: '''
Use this checklist to check in with yourself regularly:

✅ Daily Check-in:
- How am I feeling emotionally? (Happy, stressed, tired?)
- How did I sleep last night?
- Am I eating regularly?

📋 Weekly Reflections:
- What was one good moment this week?
- What drained me the most?
- What do I need to feel better?

🧭 Self-awareness is the first step toward self-care. No pressure — just honesty.
''',
  ),
];

class CopingPage extends StatefulWidget {
  const CopingPage({Key? key}) : super(key: key);

  @override
  State<CopingPage> createState() => _CopingPageState();
}

class _CopingPageState extends State<CopingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/profile.png'),
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
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kotta One',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _tools.length,
                itemBuilder: (context, index) {
                  final tool = _tools[index];
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        tool.title,
                        style: const TextStyle(
                          fontFamily: 'Kotta One',
                          fontSize: 20,
                          color: Color(0xFF9E182B),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            tool.content,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ),
                      ],
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
