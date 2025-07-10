import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/screens/explorepage.dart';
import 'package:my_app/screens/myplaylistfinal.dart';
import '../components/bottom_nav.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Addtoplaylist(),
    );
  }
}

/*                               MAIN SCREEN                                  */
class Addtoplaylist extends StatefulWidget {
  const Addtoplaylist({super.key});

  @override
  State<Addtoplaylist> createState() => _AddtoplaylistState();
}

class _AddtoplaylistState extends State<Addtoplaylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              PlaylistSearchField(),
              SizedBox(height: 20),
              Expanded(child: RecommendedSongsList()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

/*                             SEARCH TEXT FIELD                              */
class PlaylistSearchField extends StatelessWidget {
  const PlaylistSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[900],
        hintText: 'What song do you want to add?',
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.white10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}

/*                               SONG  MODEL                                  */
class Song {
  final String title;
  final String artist;
  final String svgPicture;

  Song({
    required this.title,
    required this.artist,
    required this.svgPicture,
  });
}

/*                            SAMPLE SONG DATA                                */
final List<Song> songs = [
  Song(title: 'Chinnanjiru Nilave', artist: 'Ponniyin Selvan', svgPicture: 'assets/chinnanjiru.svg'),
  Song(title: 'Vaathi Coming', artist: 'Master', svgPicture: 'assets/vaathi.svg'),
  Song(title: 'Marana Mass', artist: 'Petta', svgPicture: 'assets/maranamass.svg'),
  Song(title: 'Fire Song', artist: 'Kanguva', svgPicture: 'assets/firesong.svg'),
  Song(title: 'Hayyoda', artist: 'Vandha Edam', svgPicture: 'assets/hayyoda.svg'),
  Song(title: 'Buji kutty', artist: 'Thandel', svgPicture: 'assets/bujjikutty.svg'),
  Song(title: 'Oh Raaya', artist: 'Raayan', svgPicture: 'assets/ohraaya.svg'),
  Song(title: 'Chinnanjiru Nilave', artist: 'Ponniyin Selvan', svgPicture: 'assets/chinnanjiru.svg'),
  Song(title: 'Vaathi Coming', artist: 'Master', svgPicture: 'assets/vaathi.svg'),
  Song(title: 'Marana Mass', artist: 'Petta', svgPicture: 'assets/maranamass.svg'),
  Song(title: 'Fire Song', artist: 'Kanguva', svgPicture: 'assets/firesong.svg'),
  Song(title: 'Hayyoda', artist: 'Vandha Edam', svgPicture: 'assets/hayyoda.svg'),
  Song(title: 'Buji kutty', artist: 'Thandel', svgPicture: 'assets/bujjikutty.svg'),
  Song(title: 'Oh Raaya', artist: 'Raayan', svgPicture: 'assets/ohraaya.svg'),
];

/*                       RECOMMENDED SONGS LIST (UI)                          */
class RecommendedSongsList extends StatelessWidget {
  const RecommendedSongsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final song = songs[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF262626),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.asset(
                song.svgPicture,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(song.title,
                style: const TextStyle(color: Colors.white)),
            subtitle: Text(song.artist,
                style: const TextStyle(color: Colors.white60)),
            trailing: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                //  add this song to the playlist
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Colors.white30,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    Text("ADDED");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Myplaylistfinal()),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// /*                     PLACEHOLDER: BOTTOM NAVIGATION BAR                     */
// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     if (index == 1) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const ExplorePage()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Colors.black,
//       currentIndex: _selectedIndex,
//       selectedItemColor: Colors.pinkAccent,
//       unselectedItemColor: Colors.white54,
//       type: BottomNavigationBarType.fixed,
//       onTap: _onItemTapped,
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//         BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
//         BottomNavigationBarItem(icon: Icon(Icons.mic), label: 'Voice'),
//         BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Library'),
//         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//       ],
//     );
//   }
// }
