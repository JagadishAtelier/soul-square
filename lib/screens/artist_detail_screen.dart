import 'package:flutter/material.dart';
import '../components/bottom_nav.dart'; // Adjust path based on your structure

class ArtistDetailScreen extends StatelessWidget {
  final String artistName;
  final String artistImage;

  const ArtistDetailScreen({
    super.key,
    required this.artistName,
    required this.artistImage,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> songs = [
      {"title": "Hayyoda", "artist": "Vandha Edam", "image": "assets/gv.jpeg"},
      {"title": "Bujji kutty", "artist": "Thandel", "image": "assets/hiphop.jpeg"},
      {"title": "Oh Raaya", "artist": "Raayan", "image": "assets/neek.jpeg"},
      {"title": "Chinnanjiru Nilave", "artist": "Ponniyin Selvan", "image": "assets/songList2.jpg"},
      {"title": "Hayyoda", "artist": "Vandha Edam", "image": "assets/gv.jpeg"},
      {"title": "Bujji kutty", "artist": "Thandel", "image": "assets/hiphop.jpeg"},
      {"title": "Oh Raaya", "artist": "Raayan", "image": "assets/neek.jpeg"},
      {"title": "Chinnanjiru Nilave", "artist": "Ponniyin Selvan", "image": "assets/songList2.jpg"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      bottomNavigationBar: const BottomNavBar(), // ✅ Add this line
      body: SafeArea(
        child: Column(
          children: [
            // 🔻 Header
            Container(
              width: double.infinity,
              height: 220,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFBE1EFF), Color(0xFFFF008E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(artistImage),
                  radius: 50,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // 🎤 Artist Info
            Text(
              artistName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Playlist • 14 Songs",
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 20),

            // 🎧 Control Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.download, color: Colors.white, size: 26),
                SizedBox(width: 30),
                Icon(Icons.play_circle, color: Colors.white, size: 40),
                SizedBox(width: 30),
                Icon(Icons.shuffle, color: Colors.white, size: 26),
              ],
            ),

            const SizedBox(height: 20),

            // 🎶 Song List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F1F1F),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          song['image']!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        song['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        song['artist']!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                      trailing: const Icon(Icons.more_vert, color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
