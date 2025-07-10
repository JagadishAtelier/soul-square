import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/components/bottom_nav.dart';
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
      home: MyPlaylist(),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                               PLAYLIST PAGE                                */
/* -------------------------------------------------------------------------- */
class MyPlaylist extends StatefulWidget {
  const MyPlaylist({super.key});

  @override
  State<MyPlaylist> createState() => _MyPlaylistState();
}

class _MyPlaylistState extends State<MyPlaylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PlaylistSearchField(),
              const SizedBox(height: 20),
              const PlaylistSection(),
              const SizedBox(height: 20),
              const Text(
                'Recommended Songs',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              const Expanded(child: RecommendedSongsList()),
            ],
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'Playlist',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        const SizedBox(height: 10),

        // square box with tappable SVG
        Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                iconColor: Colors.black,
                padding: EdgeInsets.zero,
              ),
              icon: SvgPicture.asset(
                'assets/playlisticon.svg',
                height: 120,
                width: 120,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              label: const SizedBox.shrink(),
            ),
          ),
        ),

        const SizedBox(height: 10),
        const Text(
          'My playlist',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),

        // add‑to‑playlist button
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add, size: 18, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Addtoplaylist()),
                    );
                  },
                ),
              ),
              label: const Text(
                'Add to this playlist',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC81B55),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                 SONG MODEL                                 */
/* -------------------------------------------------------------------------- */
class Song {
  final String title;
  final String artist;
  final String svgPicture; 

  const Song({
    required this.title,
    required this.artist,
    required this.svgPicture
  });
}

/* -------------------------------------------------------------------------- */
/*                            SAMPLE SONG DATA                                */
/* -------------------------------------------------------------------------- */
final List<Song> songs = [
  Song(title: 'Chinnanjiru Nilave', artist: 'Ponniyin Selvan', svgPicture: 'assets/chinnanjiru.svg'),
  Song(title: 'Vaathi Coming',      artist: 'Master',          svgPicture: 'assets/vaathi.svg'),
  Song(title: 'Marana Mass',        artist: 'Petta',           svgPicture: 'assets/maranamass.svg'),
  Song(title: 'Fire Song',          artist: 'Kanguva',         svgPicture: 'assets/firesong.svg'),
  Song(title: 'Hayyoda',            artist: 'Vandha Edam',     svgPicture: 'assets/hayyoda.svg'),
  Song(title: 'Buji kutty',         artist: 'Thandel',         svgPicture: 'assets/bujjikutty.svg'),
  Song(title: 'Oh Raaya',           artist: 'Raayan',          svgPicture: 'assets/ohraaya.svg'),
];

/* -------------------------------------------------------------------------- */
/*                       RECOMMENDED SONGS LIST  (UI)                         */
/* -------------------------------------------------------------------------- */
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
                song.svgPicture,   // use the new field name
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
                // add this song to the playlist
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Colors.white30,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
        
      },

    );
    
  }
}

/* -------------------------------------------------------------------------- */
/*                     PLACEHOLDER: BOTTOM NAVIGATION BAR                     */
/* -------------------------------------------------------------------------- */
// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Colors.black,
//       selectedItemColor: Colors.pink[400],
//       unselectedItemColor: Colors.white60,
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
