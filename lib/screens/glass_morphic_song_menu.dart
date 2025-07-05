import 'dart:ui';
import 'package:flutter/material.dart';
import '../screens/share_modal.dart'; // <-- make sure path is correct

class GlassMorphicSongMenu extends StatelessWidget {
  const GlassMorphicSongMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem(icon: Icons.add, label: 'Add to your Queue'),
      MenuItem(icon: Icons.remove_circle_outline, label: 'Remove Queue Playlist'),
      MenuItem(icon: Icons.playlist_add, label: 'Add to your Playlist'),
      MenuItem(icon: Icons.remove_circle, label: 'Remove from this Playlist'),
      MenuItem(icon: Icons.favorite_border, label: 'Add to liked songs'),
      MenuItem(icon: Icons.share, label: 'Share'),
      MenuItem(icon: Icons.download_rounded, label: 'Download'),
    ];

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF0A3F7A),
                Color(0xFF171A2E),
                Color(0xFF820845),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),

              // Image + Song Info + Play Icon Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/songList2.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Let's Play",
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 3,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "A.R. Rahman",
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 3,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Icon(Icons.play_circle_fill, color: Colors.white, size: 40),
                ],
              ),

              const Divider(
                color: Color(0xFF454444),
                thickness: 1,
              ),

              // Menu items with share action
              ...menuItems.map(
                (item) => InkWell(
                  onTap: () {
                    if (item.label == 'Share') {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => const ShareModal(),
                      );
                    }
                    // Add other item conditions if needed
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white12,
                          ),
                          child: Icon(item.icon, color: Colors.white, size: 18),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            item.label,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              letterSpacing: 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final IconData icon;
  final String label;

  MenuItem({required this.icon, required this.label});
}
