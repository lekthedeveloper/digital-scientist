import 'package:digital_scientist/presentation/widget/header_widget.dart';
import 'package:flutter/material.dart';

class PercentSolutionScreen extends StatefulWidget {
  const PercentSolutionScreen({super.key});

  @override
  State<PercentSolutionScreen> createState() => _PercentSolutionScreenState();
}

class _PercentSolutionScreenState extends State<PercentSolutionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF5F9FF),
      body: Column(
        children: [HeaderWidget(headerType: 'Type-2')],
      ),
    );
  }
}
