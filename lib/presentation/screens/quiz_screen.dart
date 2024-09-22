import 'package:digital_scientist/data/models/chempath_question_model.dart';
import 'package:digital_scientist/presentation/widget/header_widget.dart';
import 'package:digital_scientist/presentation/widget/spot_test_widget.dart';
import 'package:digital_scientist/routing/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../data/models/hematology_question_model.dart';
import '../../data/models/histopath_question_model.dart';
import '../../data/models/medmicro_question_model.dart';
import '../../data/services/admob_service.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  BannerAd? _banner;
  BannerAd? _banner2;
  void _createBannerAds() {
    _banner = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: AdmobService.bannerAdsUnitId!,
        listener: AdmobService.bannerAdListener,
        request: const AdRequest())
      ..load();
    _banner2 = BannerAd(
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
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const HeaderWidget(headerType: 'Type-2'),
            _banner == null
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(left: 0.w, top: 10.h),
                    child: SizedBox(
                      height: 50.h,
                      width: 320.w,
                      child: AdWidget(
                        ad: _banner!,
                      ),
                    ),
                  ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, top: 20.h),
              child: Row(
                children: [
                  SpotTestCategory(
                    title: 'Chemical \n Pathology',
                    iconPath: 'compound.png',
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RouteManager.quizLevelScreen, arguments: {
                        'quizType': chemPathQuestion,
                        'quizTitle': 'Chemical Pathology'
                      });
                    },
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  SpotTestCategory(
                    title: 'Hematology',
                    iconPath: 'blood-test.png',
                    padding: 5,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RouteManager.quizLevelScreen, arguments: {
                        'quizType': hematologyQuestions,
                        'quizTitle': 'Hematology'
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, top: 50.h),
              child: Row(
                children: [
                  SpotTestCategory(
                    title: 'Histopathology',
                    iconPath: 'diagnosis.png',
                    padding: 5,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RouteManager.quizLevelScreen, arguments: {
                        'quizType': histopathQuestions,
                        'quizTitle': 'Histopathology'
                      });
                    },
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  SpotTestCategory(
                    title: 'Medical Microbiology',
                    iconPath: 'cell.png',
                    padding: 0,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RouteManager.quizLevelScreen, arguments: {
                        'quizType': medMicroQuestions,
                        'quizTitle': 'Medical  Microbiology'
                      });
                    },
                  ),
                ],
              ),
            ),
            _banner2 == null
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(left: 0.w, top: 100.h),
                    child: SizedBox(
                      height: 100.h,
                      width: 320.w,
                      child: AdWidget(
                        ad: _banner2!,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
