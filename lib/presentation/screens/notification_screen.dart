import 'package:digital_scientist/presentation/widget/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const HeaderWidget(headerType: 'Type-2'),
            SizedBox(
              height: 70.h,
            ),
            LottieBuilder.asset('assets/lottie/notify.json')
          ],
        ),
      ),
    );
  }
}
