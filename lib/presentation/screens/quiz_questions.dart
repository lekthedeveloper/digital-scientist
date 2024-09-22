import 'dart:math';

import 'package:digital_scientist/presentation/widget/header_widget.dart';
import 'package:digital_scientist/presentation/widget/quiz_questions_widget.dart';

import 'package:digital_scientist/routing/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import '../../data/services/admob_service.dart';

class QuizQuestions extends StatefulWidget {
  final List<QuizQuestionsWidget>? questions;
  final String? title;
  const QuizQuestions(
      {super.key, required this.questions, required this.title});

  @override
  State<QuizQuestions> createState() => _QuizQuestionsState();
}

class _QuizQuestionsState extends State<QuizQuestions> {
  BannerAd? _banner;
  int currentIndex = 0;
  void shuffleQuestions() {
    if (widget.questions != null) {
      setState(() {
        widget.questions!.shuffle(Random());
      });
    }
  }

  void _createBannerAds() {
    _banner = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: AdmobService.bannerAdsUnitId!,
        listener: AdmobService.bannerAdListener,
        request: const AdRequest())
      ..load();
  }

  @override
  void initState() {
    _createBannerAds();
    shuffleQuestions();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widget.questions == null
          ? Column(
              children: [
                const HeaderWidget(headerType: 'Type-2'),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: widget.title!.length > 18 ? 210.w : 200.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: const Color(0xffFDB870),
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                      child: Text(
                    widget.title!,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  )),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: LottieBuilder.asset('assets/lottie/nodata.json'),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 70.w,
                    ),
                    SizedBox(
                        height: 10.h,
                        width: 10.w,
                        child: Image.asset('assets/icons/ex.png')),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'No questions available for this section',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 10.sp),
                    ),
                  ],
                )
              ],
            )
          : Column(
              children: [
                const HeaderWidget(headerType: 'Type-2'),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: widget.title!.length > 18 ? 210.w : 200.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: const Color(0xffFDB870),
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                      child: Text(
                    widget.title!,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  )),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 550.h,
                  width: 320.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Q${currentIndex + 1}',
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 12.sp),
                      ),
                      IndexedStack(
                          index: currentIndex,
                          children: widget.questions ?? []),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30.w,
                          ),
                          Visibility(
                            visible: currentIndex > 0,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex--;
                                });
                              },
                              child: Container(
                                height: 30.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFDB870),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  'Previous',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: currentIndex == 0 ? 180.w : 100.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (currentIndex ==
                                  widget.questions!.length - 1) {
                                int total = 0;
                                for (var i in widget.questions!) {
                                  total += i.markObtain!;
                                }
                                Navigator.of(context).pushNamed(
                                    RouteManager.resultScreen,
                                    arguments: {'score': total.toString()});
                              } else {
                                setState(() {
                                  currentIndex++;
                                });
                              }
                            },
                            child: Container(
                              height: 30.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  color: const Color(0xffFDB870),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                currentIndex == widget.questions!.length - 1
                                    ? 'Submit'
                                    : 'Next',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              )),
                            ),
                          )
                        ],
                      ),
                      _banner == null
                          ? Container()
                          : Padding(
                              padding: EdgeInsets.only(left: 0.w, top: 20.h),
                              child: SizedBox(
                                height: 50.h,
                                width: 320.w,
                                child: AdWidget(
                                  ad: _banner!,
                                ),
                              ),
                            ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
