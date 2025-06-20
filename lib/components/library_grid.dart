import 'package:flutter/material.dart';

class LibraryGrid extends StatelessWidget {
  const LibraryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {'icon': Icons.favorite, 'label': 'Liked Songs', 'subtitle': '14 Songs'},
      {'icon': Icons.download, 'label': 'Downloads', 'subtitle': '12 Songs'},
      {'icon': Icons.history, 'label': 'Recently', 'subtitle': 'Viewed Artist'},
      {'icon': Icons.playlist_play, 'label': 'Playlists', 'subtitle': '2 Playlists'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Your Library", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(item['icon'], color: Colors.pinkAccent),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(item['label'], style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(item['subtitle'], style: const TextStyle(fontSize: 12, color: Colors.white60)),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
