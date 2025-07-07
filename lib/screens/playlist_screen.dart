import 'package:flutter/material.dart';
import '../components/bottom_nav.dart';
import 'playlist_name_screen.dart'; // Update path if needed
import 'dart:developer' as developer;

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  int selectedTabIndex = 0;

  final List<String> tabs = ['Playlists', 'Artists', 'Downloaded'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                color: Color(0xFF313131),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
        title: const Text(
          'Library',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: const [
          SizedBox(width: 42), // spacing to balance leading
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(tabs.length, (index) {
                      final isSelected = selectedTabIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTabIndex = index;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF5B83BB)
                                : const Color(0xFF4A4A4A),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            tabs[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const Spacer(),
                const SizedBox(
                  height: 30,
                  child: Center(
                    child: Text(
                      'No playlist founded',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const SizedBox(height: 80), // space for button
              ],
            ),
          ),

          // Positioned Create Playlist Button
          Positioned(
            bottom: 40,
            right: 20,
            child: GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlaylistNameScreen(),
                  ),
                );

                if (result != null && result is String) {
                  // You can use result as playlist name
                  developer.log('Created Playlist: $result');
                  // Optionally add to a list and update UI
                }
              },
              child: Container(
                height: 45,
                width: 155,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFB1965), Color(0xFF201E4E), Color(0xFF1E2D49)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    stops: [0.0, 0.84, 0.84],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '+ Create playlist',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
