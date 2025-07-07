import 'package:flutter/material.dart';
import '../screens/music_player_ui.dart'; // Adjust if needed
import '../screens/playlist_screen.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      // Navigate to Music Player
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MusicPlayerFullScreen()),
      );
      // No need to reset index after returning
    }
    if (index == 3) {
      // Navigate to Music Player
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PlaylistScreen()),
      );
      // No need to reset index after returning
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.pinkAccent,
      unselectedItemColor: Colors.white54,
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.mic), label: 'Voice'),
        BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Library'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}