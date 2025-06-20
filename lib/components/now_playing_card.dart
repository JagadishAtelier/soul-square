import 'package:flutter/material.dart';

class NowPlayingCard extends StatelessWidget {
  const NowPlayingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/neek.jpeg',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Song Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text("Artist Name", style: TextStyle(color: Colors.grey)),
            ],
          ),
          const Spacer(),
          const Icon(Icons.play_arrow_rounded, size: 30, color: Colors.white),
        ],
      ),
    );
  }
}
