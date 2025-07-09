import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DateOfBirthPage(),
  ));
}

class DateOfBirthPage extends StatefulWidget {
  const DateOfBirthPage({super.key});

  @override
  State<DateOfBirthPage> createState() => _DateOfBirthPageState();
}

class _DateOfBirthPageState extends State<DateOfBirthPage> {
  final List<String> _days   = List.generate(31, (i) => '${i + 1}');
  final List<String> _months = const [
    'Jan','Feb','Mar','Apr','May','Jun',
    'Jul','Aug','Sep','Oct','Nov','Dec'
  ];
  final List<String> _years  = List.generate(70, (i) => '${1980 + i}');

  int _dayIx   = 2;
  int _monthIx = 2;
  int _yearIx  = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _gradientBG,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 48),
              const Text(
                'Date of Birth',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),

              // ── Pickers with highlight pill underneath ───────────
              SizedBox(
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // ▼ moved: paint first => stays BEHIND the pickers
                    const Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: _highlightPill,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildPicker(
                          width: 60,
                          items: _days,
                          selectedIx: _dayIx,
                          onSelected: (ix) => setState(() => _dayIx = ix),
                        ),
                        _buildPicker(
                          width: 90,
                          items: _months,
                          selectedIx: _monthIx,
                          onSelected: (ix) => setState(() => _monthIx = ix),
                        ),
                        _buildPicker(
                          width: 70,
                          items: _years,
                          selectedIx: _yearIx,
                          onSelected: (ix) => setState(() => _yearIx = ix),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),

              // Next button
              Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: SizedBox(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const VerifiedPage()),
                      );
                    },
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFF83C8E), Color(0xFFFD3E6E)],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Next',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                            SizedBox(width: 6),
                            Icon(Icons.arrow_forward_ios,
                                size: 14, color: Colors.white),
                          ],
                        ),
                      ),
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

  // Single picker builder
  Widget _buildPicker({
    required double width,
    required List<String> items,
    required int selectedIx,
    required ValueChanged<int> onSelected,
  }) {
    return SizedBox(
      width: width,
      child: CupertinoPicker(
        itemExtent: 48,
        scrollController:
            FixedExtentScrollController(initialItem: selectedIx),
        selectionOverlay: const SizedBox(), // we supply our own overlay
        onSelectedItemChanged: onSelected,
        diameterRatio: 1.35,
        magnification: 1.0,
        useMagnifier: false,
        squeeze: 1.1,
        children: items
            .map((label) => Center(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 20,
                      letterSpacing: 1,
                      color: Colors.white70,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

// Verification screen
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
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Shared decorations
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
  child: SizedBox(height: 48, width: double.infinity),
);
