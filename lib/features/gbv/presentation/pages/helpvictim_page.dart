import 'package:flutter/material.dart';
import '../../../../shared/widgets/custom_bottom_navigation_bar.dart';

class HelpVictimPage extends StatefulWidget {
  const HelpVictimPage({super.key});

  @override
  State<HelpVictimPage> createState() => _HelpVictimPageState();
}

class _HelpVictimPageState extends State<HelpVictimPage> {
  bool isPlaying = false;
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF9E182B),
            size: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border, 
              color: isFavorited ? Color(0xFF9E182B) : Color(0xFF9E182B)
            ),
            onPressed: () {
              setState(() {
                isFavorited = !isFavorited;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.download, color: Color(0xFF9E182B)),
            onPressed: () {
              // Handle download
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Spacer(),

            // Podcast Avatar/Image
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.pink.shade200, Colors.purple.shade200],
                ),
              ),
              child: Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.brown,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Title
            const Text(
              'Help a Victim',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                color: Color(0xFF9E182B),
              ),
            ),

            const SizedBox(height: 60),

            // Control Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Previous/Rewind
                IconButton(
                  onPressed: () {
                    // Handle previous/rewind
                  },
                  icon: const Icon(
                    Icons.skip_previous,
                    color: Color(0xFF9E182B),
                    size: 32,
                  ),
                ),

                // Play/Pause
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF9E182B),
                    ),
                    child: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),

                // Next/Forward
                IconButton(
                  onPressed: () {
                    // Handle next/forward
                  },
                  icon: const Icon(
                    Icons.skip_next,
                    color: Color(0xFF9E182B),
                    size: 32,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Share and Favorite buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    // Handle share
                  },
                  icon: const Icon(
                    Icons.share,
                    color: Color(0xFF9E182B),
                    size: 24,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorited = !isFavorited;
                    });
                  },
                  icon: Icon(
                    isFavorited ? Icons.star : Icons.star_border,
                    color: isFavorited ? Color(0xFF9E182B) : Color(0xFF9E182B),
                    size: 24,
                  ),
                ),
              ],
            ),

            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentIndex: 0, // Set home as active
      ),
    );
  }


}
