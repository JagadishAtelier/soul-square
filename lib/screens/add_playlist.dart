import 'package:flutter/material.dart';
import '../components/popular_artists.dart';
import '../components/song_list.dart';
import '../screens/artist_detail_screen.dart';
import '../components/bottom_nav.dart'; // ✅ Import the BottomNavBar

class AddPlayListPage extends StatelessWidget {
  const AddPlayListPage({super.key});

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
      bottomNavigationBar: const BottomNavBar(), // ✅ Add bottom nav here
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
              const SizedBox(height: 12),
              const SongList(),
            ],
          ),
        ),
      ),
    );
  }
}
