import 'package:flutter/material.dart';

class ArtistList extends StatelessWidget {
  const ArtistList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> artists = [
      {'name': 'Swetha Mohan', 'image': 'assets/Shweta_Mohan.jpg'},
      {'name': 'Hip Hop Tamizha', 'image': 'assets/hiphop.jpeg'},
      {'name': 'G V Prakash', 'image': 'assets/gv.jpeg'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Popular Artists", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: artists.map((artist) {
            return Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(artist['image']!),
                  radius: 35,
                ),
                const SizedBox(height: 6),
                Text(
                  artist['name']!,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
