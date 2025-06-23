import 'package:flutter/material.dart';
import '../screens/search_screen.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white70, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/profile.avif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Good Morning",
                style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
              ),
              Text(
                "Amour",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            child: const Icon(Icons.search, color: Colors.white, size: 26),
          ),
          const SizedBox(width: 16),
          const Icon(Icons.notifications, color: Colors.grey, size: 26),
        ],
      ),
    );
  }
}
