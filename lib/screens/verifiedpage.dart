import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class VerifiedPage extends StatelessWidget {
  const VerifiedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _gradientBG,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.verified, size: 90, color: Colors.white),
              SizedBox(height: 30),
              Text(
                'Successfully Verified',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


const _gradientBG = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1D2671), Color(0xFFC33764)],
  ),
);

const _highlightPill = DecoratedBox(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    gradient: LinearGradient(
      colors: [Color(0xFF542550), Color(0xFF2B093C)],
    ),
  ),
  child: SizedBox(
    height: 48,
    width: double.infinity,
  ),
);
