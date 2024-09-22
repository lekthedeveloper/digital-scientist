import 'package:digital_scientist/presentation/widget/header_widget.dart';
import 'package:digital_scientist/presentation/widget/quizlevel_widget.dart';
import 'package:digital_scientist/routing/navigation_controller.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class QuizQuestionScreen extends StatelessWidget {
  final Map<String, dynamic>? quizType;
  final String? quizTitle;
  const QuizQuestionScreen(
      {super.key, required this.quizType, required this.quizTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderWidget(headerType: 'Type-2'),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 590.h,
            width: 350.w,
            child: Stack(
              children: [
                Positioned(
                  left: 20.w,
                  top: 10.h,
                  child: QuizLevel(
                    function: () {
                      Navigator.of(context).pushNamed(
                          RouteManager.quizQuestionScreen,
                          arguments: {
                            'questionLevel': quizType!['Amateur'],
                            'title': quizTitle == null ? '' : quizTitle!
                          });
                    },
                    levelName: 'Amateur',
                    iconTitle: 'pencil.png',
                  ),
                ),
                Positioned(
                  left: 170.w,
                  top: 150.h,
                  child: QuizLevel(
                    function: () {
                      Navigator.of(context).pushNamed(
                          RouteManager.quizQuestionScreen,
                          arguments: {
                            'questionLevel': quizType!['Easy'],
                            'title': quizTitle == null ? '' : quizTitle!
                          });
                    },
                    textLeftAlignment: false,
                    textLeftPadding: 15.0,
                    levelName: 'Easy',
                    rotateImage: false,
                    iconTitle: 'book.png',
                  ),
                ),
                Positioned(
                  left: 40.w,
                  top: 280.h,
                  child: QuizLevel(
                    function: () {
                      Navigator.of(context).pushNamed(
                          RouteManager.quizQuestionScreen,
                          arguments: {
                            'questionLevel': quizType!['Hard'],
                            'title': quizTitle == null ? '' : quizTitle!
                          });
                    },
                    rotateImage: false,
                    textLeftAlignment: true,
                    textLeftPadding: 15.0,
                    levelName: 'Hard',
                    iconTitle: 'crown.png',
                  ),
                ),
                Positioned(
                  left: 130.w,
                  top: 430.h,
                  child: QuizLevel(
                    function: () {
                      Navigator.of(context).pushNamed(
                          RouteManager.quizQuestionScreen,
                          arguments: {
                            'questionLevel': quizType!['Professional'],
                            'title': quizTitle == null ? '' : quizTitle!
                          });
                    },
                    textLeftAlignment: false,
                    textLeftPadding: 15.0,
                    rotateImage: false,
                    levelName: 'Professional',
                    iconTitle: 'bicycle.png',
                  ),
                ),
                Positioned(
                    top: 450.h,
                    child: SizedBox(
                      height: 150.h,
                      width: 150.w,
                      child: Lottie.asset(
                        'assets/lottie/quiz.json',
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
