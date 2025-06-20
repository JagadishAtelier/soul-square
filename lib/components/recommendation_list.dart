import 'package:flutter/material.dart';

class RecommendationList extends StatelessWidget {
  const RecommendationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("You might like", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Column(
          children: [
            _buildRecommendationItem('Let her Go', 'Passenger', 'assets/Let-her-go-by-passenger.jpg'),
            const SizedBox(height: 10),
            _buildRecommendationItem('Better with you', 'Kushagra · Saaheal', 'assets/songList2.jpg'),
          ],
        )
      ],
    );
  }

  Widget _buildRecommendationItem(String title, String artist, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(imagePath, height: 50, width: 50, fit: BoxFit.cover),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(artist, style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.more_vert, color: Colors.white70),
        ],
      ),
    );
  }
}
