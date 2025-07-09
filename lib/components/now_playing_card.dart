import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:my_app/screens/myplaylist.dart';

class NowPlayingCard extends StatelessWidget {
  const NowPlayingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 149,
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color.fromARGB(186, 146, 4, 103), // Figma color with opacity
            Color(0x5E1F4694), // ARGB color with 58% opacity
          ],
          stops: [0.0, 0.7],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 🔹 First Row: Image + Texts + Icon
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/neek.jpeg',
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Now Playing",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Golden Sparrow",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.person_add_alt,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  // push the next screen
                 
                  
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(BootstrapIcons.skip_start, color: Colors.white, size: 20),
              SizedBox(width: 10),
              Icon(Icons.pause_circle_filled, color: Colors.white, size: 40),
              SizedBox(width: 10),
              Icon(BootstrapIcons.skip_end, color: Colors.white, size: 20),
              Spacer(),
              Icon(
                BootstrapIcons.heart_fill, // ✅ filled version
                color: Color.fromARGB(255, 111, 64, 138), // same as before
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
