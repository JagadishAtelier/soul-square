import 'package:flutter/material.dart';

class PopularArtists extends StatelessWidget {
  final Function(String name, String image)? onArtistTap;

  const PopularArtists({super.key, this.onArtistTap});

  final List<Map<String, dynamic>> artists = const [
    {"name": "Shraya Ghoshal", "color": Color(0xFF48C0E0), "image": "assets/Shweta_Mohan.jpg"},
    {"name": "S P Balasubrahmanyam", "color": Color(0xFF9D71D4), "image": "assets/gv.jpeg"},
    {"name": "Hip Hop Tamizha", "color": Color(0xFFB89090), "image": "assets/hiphop.jpeg"},
    {"name": "Justin Bieber", "color": Color(0xFF73B69A), "image": "assets/hiphop.jpeg"},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      physics: const NeverScrollableScrollPhysics(),
      children: artists.map((artist) {
        return GestureDetector(
          onTap: () {
            if (onArtistTap != null) {
              onArtistTap!(artist['name'], artist['image']);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: artist['color'],
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(artist['image']),
                  radius: 24,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    artist['name'],
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
