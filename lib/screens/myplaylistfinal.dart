import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/screens/addtoplaylist.dart';

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
      home: Myplaylistfinal(),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                               PLAYLIST PAGE                                */
/* -------------------------------------------------------------------------- */
class Myplaylistfinal extends StatefulWidget {
  const Myplaylistfinal({super.key});
  @override
  State<Myplaylistfinal> createState() => _MyplaylistfinalState();
}

class _MyplaylistfinalState extends State<Myplaylistfinal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                /* ───────── search bar ───────── */
                PlaylistSearchField(),
                SizedBox(height: 20),

                /* ───────── playlist collage ───────── */
                PlaylistSection(),
                SizedBox(height: 20),

                /* ───────── first list (⋮ instead of +) ───────── */
                SizedBox(height: 220, child: SongsListWithMenu()),

                SizedBox(height: 20),

                /* ───────── header + standard list ───────── */
                Text(
                  'Recommended Songs',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(height: 220, child: RecommendedSongsList()),

                SizedBox(height: 20), // bottom padding
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                             SEARCH TEXT FIELD                              */
/* -------------------------------------------------------------------------- */
class PlaylistSearchField extends StatelessWidget {
  const PlaylistSearchField({super.key});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[900],
        hintText: 'Find in playlist',
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                            PLAYLIST (TOP SECTION)                          */
/* -------------------------------------------------------------------------- */
class PlaylistSection extends StatelessWidget {
  const PlaylistSection({super.key});

  static const _covers = [
    'assets/playgrid1.svg',
    'assets/playgrid2.svg',
    'assets/playgrid3.svg',
    'assets/playgrid4.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text('Playlist', style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
        const SizedBox(height: 10),
        Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.antiAlias,
            child: GridView.count(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              children: _covers
                  .map((p) => ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: SvgPicture.asset(p, fit: BoxFit.cover),
                      ))
                  .toList(),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text('My playlist',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Addtoplaylist()),
                    );
                  },
                  icon: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.add, size: 24, color: Colors.white),
                  ),
                  label: const Text('Add', style: TextStyle(color: Colors.white)),
                  style: _btnStyle(),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, size: 24, color: Colors.white),
                  label: const Text('Edit', style: TextStyle(color: Colors.white)),
                  style: _btnStyle(),
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: IconButton(icon: const Icon(Icons.play_arrow), color: Colors.black, onPressed: () {}),
            ),
          ],
        ),
      ],
    );
  }

  ButtonStyle _btnStyle() => ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFC81B55),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: const TextStyle(fontSize: 14),
      );
}

/* -------------------------------------------------------------------------- */
/*                                 SONG MODEL                                 */
/* -------------------------------------------------------------------------- */
class Song {
  final String title;
  final String artist;
  final String svgPicture;
  const Song({required this.title, required this.artist, required this.svgPicture});
}

/* -------------------------------------------------------------------------- */
/*                            SAMPLE SONG DATA                                */
/* -------------------------------------------------------------------------- */
final List<Song> songs = [
  Song(title: 'Chinnanjiru Nilave', artist: 'Ponniyin Selvan', svgPicture: 'assets/chinnanjiru.svg'),
  Song(title: 'Vaathi Coming', artist: 'Master', svgPicture: 'assets/vaathi.svg'),
  Song(title: 'Marana Mass', artist: 'Petta', svgPicture: 'assets/maranamass.svg'),
  Song(title: 'Fire Song', artist: 'Kanguva', svgPicture: 'assets/firesong.svg'),
  Song(title: 'Hayyoda', artist: 'Vandha Edam', svgPicture: 'assets/hayyoda.svg'),
  Song(title: 'Buji kutty', artist: 'Thandel', svgPicture: 'assets/bujjikutty.svg'),
  Song(title: 'Oh Raaya', artist: 'Raayan', svgPicture: 'assets/ohraaya.svg'),
  Song(title: 'Chinnanjiru Nilave', artist: 'Ponniyin Selvan', svgPicture: 'assets/chinnanjiru.svg'),
];

/* -------------------------------------------------------------------------- */
/*               LIST WITH ⋮ (MORE VERT) INSTEAD OF + ICON                    */
/* -------------------------------------------------------------------------- */
class SongsListWithMenu extends StatelessWidget {
  const SongsListWithMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, i) {
        final s = songs[i];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF262626),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.asset(s.svgPicture, width: 50, height: 50, fit: BoxFit.cover),
            ),
            title: Text(s.title, style: const TextStyle(color: Colors.white)),
            subtitle: Text(s.artist, style: const TextStyle(color: Colors.white60)),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {
                // handle more‑options menu here
              },
            ),
          ),
        );
      },
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                       STANDARD RECOMMENDED SONGS LIST                      */
/* -------------------------------------------------------------------------- */
class RecommendedSongsList extends StatelessWidget {
  const RecommendedSongsList({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, i) {
        final s = songs[i];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF262626),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.asset(s.svgPicture, width: 50, height: 50, fit: BoxFit.cover),
            ),
            title: Text(s.title, style: const TextStyle(color: Colors.white)),
            subtitle: Text(s.artist, style: const TextStyle(color: Colors.white60)),
            trailing: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {},
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(color: Colors.white30, shape: BoxShape.circle),
                child: const Icon(Icons.add, size: 18, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                          BOTTOM NAVIGATION BAR                             */
/* -------------------------------------------------------------------------- */
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.pink[400],
      unselectedItemColor: Colors.white60,
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
