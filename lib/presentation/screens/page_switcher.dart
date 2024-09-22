import 'package:digital_scientist/presentation/screens/calculator_screen.dart';
import 'package:digital_scientist/presentation/screens/home_screen.dart';
import 'package:digital_scientist/presentation/screens/quiz_screen.dart';
import 'package:digital_scientist/presentation/screens/spot_test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../business_logic/navigation/bottom_navigation_provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final bottomNavigationIndexController = [
      const HomeScreen(),
      const SpotTestScreen(),
      const QuizScreen(),
      const CalculatorScreen()
    ];
    return Consumer<BottomNavProvider>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: AnimatedSwitcher(
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            duration: const Duration(milliseconds: 500),
            child: bottomNavigationIndexController[value.index]),
        bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle:
                TextStyle(fontFamily: 'Poppins', fontSize: 11.sp),
            unselectedLabelStyle:
                TextStyle(fontFamily: 'Poppins', fontSize: 11.sp),
            selectedItemColor: const Color(0xff407CE2),
            unselectedItemColor: Colors.grey[700],
            showUnselectedLabels: true,
            currentIndex: value.index,
            showSelectedLabels: true,
            onTap: (index) {
              value.changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                  activeIcon: SizedBox(
                      height: 18.h,
                      width: 18.w,
                      child: Image.asset('assets/icons/home_active.png')),
                  label: 'Home',
                  icon: SizedBox(
                      height: 18.h,
                      width: 18.w,
                      child: Image.asset('assets/icons/home.png'))),
              BottomNavigationBarItem(
                label: 'Spot Test',
                activeIcon: SizedBox(
                    height: 18.h,
                    width: 18.w,
                    child: Image.asset('assets/icons/target_active.png')),
                icon: SizedBox(
                    height: 18.h,
                    width: 18.w,
                    child: Image.asset('assets/icons/target.png')),
              ),
              BottomNavigationBarItem(
                activeIcon: SizedBox(
                    height: 18.h,
                    width: 18.w,
                    child: Image.asset('assets/icons/test_active.png')),
                label: 'Quiz',
                icon: SizedBox(
                    height: 18.h,
                    width: 18.w,
                    child: Image.asset('assets/icons/online-test.png')),
              ),
              BottomNavigationBarItem(
                  label: 'Calculator',
                  activeIcon: SizedBox(
                      height: 18.h,
                      width: 18.w,
                      child: Image.asset('assets/icons/calculator_active.png')),
                  icon: SizedBox(
                      height: 18.h,
                      width: 18.w,
                      child: Image.asset('assets/icons/calculator.png')))
            ]),
      ),
    );
  }
}
