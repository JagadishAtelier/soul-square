import 'package:flutter/material.dart';

class LibraryGrid extends StatelessWidget {
  const LibraryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'icon': Icons.favorite,
        'label': 'Liked Songs',
        'subtitle': '14 Songs',
        'color': Color.fromARGB(255, 111, 64, 138)
      },
      {
        'icon': Icons.download,
        'label': 'Downloads',
        'subtitle': '12 Songs',
        'color': Colors.blueAccent
      },
      {
        'icon': Icons.history,
        'label': 'Recently',
        'subtitle': 'Viewed Artist',
        'color': Colors.pinkAccent
      },
      {
        'icon': Icons.playlist_play,
        'label': 'Playlists',
        'subtitle': '2 Playlists',
        'color': Colors.purpleAccent
      },
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Library",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 161 / 106,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return SizedBox(
                height: 106, // fixed height
                width: 161,  // fixed width
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // 👈 align left
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item['icon'],
                        color: item['color'], // 🎯 dynamic icon color
                        size: 30,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item['label'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize:15,
                        ),
                      ),
                      Text(
                        item['subtitle'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
