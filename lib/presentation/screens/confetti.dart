// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ConfettiScreen(),
    );
  }
}

class ConfettiScreen extends StatefulWidget {
  const ConfettiScreen({super.key});

  @override
  _ConfettiScreenState createState() => _ConfettiScreenState();
}

class _ConfettiScreenState extends State<ConfettiScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();

    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment
                .topCenter, // Positioning the confetti at the top center
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality:
                  BlastDirectionality.explosive, // Explosive directionality
              maxBlastForce: 5, // Set a maximum blast force
              minBlastForce: 2, // Minimum blast force
              particleDrag: 0.01, // Apply drag to the confetti
              emissionFrequency: 0.6, // Frequency of emission
              numberOfParticles: 2, // Number of particles to emit
              gravity: 0.1, // More gravity means faster falling
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // Colors of the confetti
            ),
          ),
          Positioned(
              top: 200,
              left: 200.w,
              child: Text(
                'hi',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 20.sp),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Party!',
        child: const Icon(Icons.party_mode),
      ),
    );
  }
}
