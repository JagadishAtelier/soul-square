import 'package:flutter/material.dart';
import '../components/bottom_nav.dart';
import 'pop_music.dart'; // For genre-based chips
import 'popular_playlist2.dart'; // ✅ New dynamic playlist page

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  void _onArtistTap(String name, String image) {}

  final List<Map<String, dynamic>> artists = const [
    {
      "name": "Shraya \nGhoshal",
      "gradient": [Color(0xFF77A7B0), Color(0xFF3E575C)],
      "image": "assets/shreyaghosal.svg"
    },
    {
      "name": "S P \nBalasubrahmanyam",
      "gradient": [Color(0xFFAE76B9), Color(0xFF4E3553)],
      "image": "assets/spb.svg"
    },
    {
      "name": "Hip Hop \nTamizha",
      "gradient": [Color(0xFFA37272), Color(0xFF3D2B2B)],
      "image": "assets/hiphop.svg"
    },
    {
      "name": "Justin \nBieber",
      "gradient": [Color(0xFF66B290), Color(0xFF2C4C3E)],
      "image": "assets/bieber.svg"
    },
  ];

  Widget _chip(String label) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PopMusicPage(title: label),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF401C7D), Color(0xFF7B0463)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(label, style: const TextStyle(color: Colors.white)),
        ),
      );

  Widget _playlistTile(IconData icon, String title, String subtitle, List<Color> colors) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PopularPlaylistPage(
              title: title,
              subtitle: subtitle,
              icon: icon,
              gradient: colors,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 126,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 32),
          ),
          const SizedBox(height: 8),
          Text(title,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              maxLines: 1),
          Text(subtitle,
              style: const TextStyle(color: Colors.white54, fontSize: 12)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Explore', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white10, borderRadius: BorderRadius.circular(30)),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.white),
                  hintText: 'What do you want to listen to?',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Chips
            SizedBox(
              height: 41,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    ['All', 'Pop', 'Hiphop', 'Broken', 'Love'].map(_chip).toList(),
              ),
            ),
            const SizedBox(height: 30),

            // Trending Artists
            const Text('Trending Artists',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 162 / 70,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: artists.map((artist) {
                return GestureDetector(
                  onTap: () => _onArtistTap(artist['name'], artist['image']),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: (artist['gradient'] as List<Color>),
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundImage: AssetImage(artist['image']),
                            radius: 24),
                        const SizedBox(width: 8),
                        Expanded(
                            child: Text(artist['name'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500))),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 26),

            // Popular Playlists
            const Text('Popular Playlists',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 25,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _playlistTile(Icons.play_circle, "Today's Top Hits", '14 Songs',
                    const [Color(0xFF7041A2), Color(0xFF680C6B)]),
                _playlistTile(Icons.nightlight, 'Night Chill', '18 Songs',
                    const [Color(0xFF370E63), Color(0xFF401042)]),
                _playlistTile(Icons.local_fire_department, 'Viral Hits', '20 Songs',
                    const [Color(0xFF6947E5), Color(0xFF6947E5)]),
                _playlistTile(Icons.favorite, 'Love Vibes', '30 Songs',
                    const [Color(0xFF7041A2), Color(0XFF4A54B5), Color(0xFF680C6B)]),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
