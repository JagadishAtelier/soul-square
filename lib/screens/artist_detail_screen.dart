import 'package:flutter/material.dart';

class ArtistDetailScreen extends StatelessWidget {
  final String artistName;
  final String artistImage;

  const ArtistDetailScreen({
    super.key,
    required this.artistName,
    required this.artistImage,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> songs = [
      {"title": "Hayyoda", "artist": "Vandha Edam", "image": "assets/gv.jpeg"},
      {"title": "Bujji Kutty", "artist": "Thandel", "image": "assets/hiphop.jpeg"},
      {"title": "Oh Raaya", "artist": "Raayan", "image": "assets/neek.jpeg"},
      {"title": "Chinnanjiru Nilave", "artist": "Ponniyin Selvan", "image": "assets/songList2.jpg"},
      {"title": "Vaathi Coming", "artist": "Master", "image": "assets/gv.jpeg"},
      {"title": "Marana Mass", "artist": "Petta", "image": "assets/hiphop.jpeg"},
      {"title": "Fire Song", "artist": "Kanguva", "image": "assets/neek.jpeg"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFBE1EFF), Color(0xFFFF008E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(artistImage),
                    radius: 50,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    artistName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Playlist • 14 Songs",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.download, color: Colors.white, size: 30),
                      SizedBox(width: 40),
                      Icon(Icons.play_circle, color: Colors.white, size: 40),
                      SizedBox(width: 40),
                      Icon(Icons.shuffle, color: Colors.white, size: 30),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F1F1F),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          song['image']!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        song['title']!,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        song['artist']!,
                        style: const TextStyle(color: Colors.white70),
                      ),
                      trailing: const Icon(Icons.more_vert, color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
