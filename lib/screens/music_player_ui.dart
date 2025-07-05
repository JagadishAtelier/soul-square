import 'package:flutter/material.dart';
import '../screens/glass_morphic_song_menu.dart';
import '../components/bottom_nav.dart'; // ✅ Bottom Nav import

class MusicPlayerFullScreen extends StatelessWidget {
  const MusicPlayerFullScreen({super.key});

  void _showSongOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const GlassMorphicSongMenu(),
    );
  }

  final List<Map<String, String>> songs = const [
    {"title": "Let her Go", "artist": "Passenger", "image": "assets/songList2.jpg"},
    {"title": "Stay", "artist": "Justin Bieber", "image": "assets/neek.jpeg"},
    {"title": "Hayyoda", "artist": "Vandha Edam", "image": "assets/songList2.jpg"},
    {"title": "Bujji kutty", "artist": "Thandel", "image": "assets/neek.jpeg"},
    {"title": "Oh Raaya", "artist": "Raayan", "image": "assets/songList2.jpg"},
    {"title": "Chinnanjiru Nilave", "artist": "Ponniyin Selvan", "image": "assets/neek.jpeg"},
    {"title": "Vaathi Coming", "artist": "Master", "image": "assets/songList2.jpg"},
    {"title": "Marana Mass", "artist": "Petta", "image": "assets/neek.jpeg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: const BottomNavBar(), // ✅ Bottom Nav added
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🎵 Music Player Section with Gradient
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2C5274), Color(0xFF1D1547), Color(0xFF742346)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
  onTap: () {
    Navigator.pop(context); // 🔙 Go back
  },
  child: Container(
    height: 36,
    width: 36,
    decoration: BoxDecoration(
      color: Colors.grey[800], // 🔘 Grey background
      shape: BoxShape.circle,
    ),
    child: const Icon(
      Icons.chevron_left,
      color: Colors.white,
      size: 24,
    ),
  ),
),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Let’s Play",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "A.R. Rahman",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_vert, color: Colors.white),
                          onPressed: () => _showSongOptions(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Album Art
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          image: AssetImage("assets/neek.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Progress Bar
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFFFF2C84),
                        inactiveTrackColor: Colors.white38,
                        thumbColor: Colors.white,
                        trackHeight: 4,
                      ),
                      child: Slider(
                        value: 0.3,
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Player Controls
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.shuffle, color: Colors.white70),
                          const Icon(Icons.skip_previous, color: Colors.white, size: 36),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [Colors.white, Colors.white70],
                              ),
                            ),
                            child: const Icon(Icons.play_arrow, size: 36, color: Colors.black),
                          ),
                          const Icon(Icons.skip_next, color: Colors.white, size: 36),
                          const Icon(Icons.repeat, color: Colors.white70),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              // 📄 Playlist Section
              Container(
                color: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: songs.map((song) {
                    return Container(
                      height: 91,
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F1F1F),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              song['image']!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  song['title']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  song['artist']!,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.more_vert, color: Colors.white),
                            onPressed: () => _showSongOptions(context),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
