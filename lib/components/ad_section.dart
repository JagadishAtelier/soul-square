import 'package:flutter/material.dart';
class AdSection extends StatelessWidget {
  const AdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
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
    );
  }
}
