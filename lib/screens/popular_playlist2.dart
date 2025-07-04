import 'package:flutter/material.dart';
import '../components/popular_artists.dart';
import '../components/song_list.dart';
import '../screens/artist_detail_screen.dart';

class PopularPlaylist2 extends StatelessWidget {
  const PopularPlaylist2({super.key});

  void _navigateToArtistDetail(BuildContext context, String name, String image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArtistDetailScreen(
          artistName: name,
          artistImage: image,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D0D),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔍 Search Box
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.white54),
                    hintText: "Search artists or songs...",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 🌟 Centered "Viral" Title and Box
              Center(
                child: Column(
                  children: [
                    const Text(
                      "Viral",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
  height: 200,
  width: 200,
  decoration: BoxDecoration(
    color: const Color(0xFF6947E5),
    borderRadius: BorderRadius.circular(20),
  ),
  child: Stack(
    children: [
      // 🔥 Fire icon at center (slightly higher)
      Align(
        alignment: const Alignment(0, -0.3),
        child: Image.asset(
          'assets/fire_icon.png', // Place your fire icon here
          height: 50,
          width: 50,
        ),
      ),
      // ▶️ Play button at bottom-right
      Positioned(
        bottom: 12,
        right: 12,
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.play_arrow,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
    ],
  ),
),

                  ],
                ),
              ),

              const SizedBox(height: 24),

              const SongList(),
            ],
          ),
        ),
      ),
    );
  }
}
