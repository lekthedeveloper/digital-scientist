import 'package:digital_scientist/data/services/admob_service.dart';
import 'package:digital_scientist/presentation/widget/header_widget.dart';
import 'package:digital_scientist/presentation/widget/spot_test_widget.dart';
import 'package:digital_scientist/routing/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SpotTestScreen extends StatefulWidget {
  const SpotTestScreen({super.key});

  @override
  State<SpotTestScreen> createState() => _SpotTestScreenState();
}

class _SpotTestScreenState extends State<SpotTestScreen> {
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
            SizedBox(
              height: 20.h,
            ),
            _banner2 == null
                ? Container()
                : SizedBox(
                    height: 50.h,
                    width: 300.w,
                    child: AdWidget(
                      ad: _banner2!,
                    ),
                  ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, top: 50.h),
              child: Row(
                children: [
                  SpotTestCategory(
                    title: 'Chemical \n Pathology',
                    iconPath: 'compound.png',
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          RouteManager.spotQuestionScreen,
                          arguments: {'title': 'Chemical Pathology'});
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
                      Navigator.of(context).pushNamed(
                          RouteManager.spotQuestionScreen,
                          arguments: {'title': 'Hematology'});
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
                      Navigator.of(context).pushNamed(
                          RouteManager.spotQuestionScreen,
                          arguments: {'title': 'Histopathology'});
                    },
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  SpotTestCategory(
                    title: 'Medical \n Microbiology',
                    iconPath: 'cell.png',
                    padding: 0,
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          RouteManager.spotQuestionScreen,
                          arguments: {'title': 'Medical Microbiology'});
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            _banner == null
                ? Container()
                : SizedBox(
                    height: 130.h,
                    width: 300.w,
                    child: AdWidget(
                      ad: _banner!,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
