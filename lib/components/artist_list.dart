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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Popular Artists",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: artists.map((artist) {
              return Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: Column(
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(artist['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      artist['name']!,
                      style: const TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
