import 'package:flutter/material.dart';
import '../components/song_list.dart';
import '../components/bottom_nav.dart'; // ✅ Import your BottomNavBar

class PopMusicPage extends StatefulWidget {
  final String title;

  const PopMusicPage({super.key, required this.title});

  @override
  State<PopMusicPage> createState() => _PopMusicPageState();
}

class _PopMusicPageState extends State<PopMusicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: const BottomNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: SongList(),
      ),
    );
  }
}
