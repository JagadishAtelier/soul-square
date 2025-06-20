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
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF1F1F1F),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(song['image']!, width: 50, height: 50, fit: BoxFit.cover),
            ),
            title: Text(song['title']!, style: const TextStyle(color: Colors.white)),
            subtitle: Text(song['artist']!, style: const TextStyle(color: Colors.white70)),
            trailing: const Icon(Icons.more_vert, color: Colors.white),
          ),
        );
      }).toList(),
    );
  }
}
