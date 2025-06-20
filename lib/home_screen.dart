import 'package:flutter/material.dart';
import 'components/top_bar.dart';
import 'components/now_playing_card.dart';
import 'components/recommendation_list.dart';
import 'components/artist_list.dart';
import 'components/library_grid.dart';
import 'components/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBar(),
              const SizedBox(height: 20),
              NowPlayingCard(),
              const SizedBox(height: 20),
              RecommendationList(),
              const SizedBox(height: 20),
              ArtistList(),
              const SizedBox(height: 20),
              LibraryGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
