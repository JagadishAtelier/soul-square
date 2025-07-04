import 'package:flutter/material.dart';

class SongList extends StatelessWidget {
  const SongList({super.key});


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
  return Column(
    children: songs.map((song) {
      return Container(
        height: 91,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12), // Padding inside the card
        decoration: BoxDecoration(
          color: const Color(0xFF1F1F1F),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
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
                mainAxisAlignment: MainAxisAlignment.center, // Center text vertically
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
            const Icon(Icons.more_vert, color: Colors.white),
          ],
        ),
      );
    }).toList(),
  );
}
}
