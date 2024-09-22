import 'dart:math';

import 'package:digital_scientist/presentation/widget/header_widget.dart';
import 'package:digital_scientist/presentation/widget/spottest_question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../data/services/admob_service.dart';
import '../../routing/navigation_controller.dart';

class SpotTestQuestions extends StatefulWidget {
  final String? title;
  const SpotTestQuestions({super.key, required this.title});

  @override
  State<SpotTestQuestions> createState() => _SpotTestQuestionsState();
}

class _SpotTestQuestionsState extends State<SpotTestQuestions> {
  var random = Random();
  int currentIndex = 0;
  BannerAd? _banner;
  List<SpotTestQuestionsWidget> questions = [
    SpotTestQuestionsWidget(
        imageLink: 'lab1.jpeg',
        quizOptions: const ['Blip', 'Zorg', 'Quix', 'Plim'],
        quizQuestion: 'Identify the instrument',
        markObtain: 0,
        selectedOption: '',
        correctOption: ''),
    SpotTestQuestionsWidget(
        imageLink: 'lab2.jpeg',
        quizOptions: const ['Blip', 'Zorg', 'Quix', 'Plim'],
        quizQuestion: 'Identify the instrument',
        markObtain: 0,
        selectedOption: '',
        correctOption: ''),
    SpotTestQuestionsWidget(
        imageLink: 'lab3.jpeg',
        quizOptions: const ['Blip', 'Zorg', 'Quix', 'Plim'],
        quizQuestion: 'Identify the instrument',
        markObtain: 0,
        selectedOption: '',
        correctOption: ''),
    SpotTestQuestionsWidget(
        imageLink: 'lab4.jpeg',
        quizOptions: const ['Blip', 'Zorg', 'Quix', 'Plim'],
        quizQuestion: 'Identify the instrument',
        markObtain: 0,
        selectedOption: '',
        correctOption: ''),
  ];
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            height: 570.h,
            width: 320.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Q${currentIndex + 1}',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 12.sp),
                ),
                IndexedStack(
                  index: currentIndex,
                  children: questions,
                ),
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
                        if (currentIndex == questions.length - 1) {
                          Navigator.of(context)
                              .pushNamed(RouteManager.resultScreen);
                          int total = 0;
                          for (var i in questions) {
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
                          currentIndex == questions.length - 1
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
