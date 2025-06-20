import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/profile.avif'), // replace with your image
          radius: 20,
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Morning", style: TextStyle(color: Colors.white70)),
            Text("Amour", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const Spacer(),
        const Icon(Icons.search, color: Colors.white),
        const SizedBox(width: 15),
        const Icon(Icons.notifications, color: Colors.white),
      ],
    );
  }
}
