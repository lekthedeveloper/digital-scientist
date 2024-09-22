import 'package:digital_scientist/presentation/widget/header_widget.dart';
import 'package:digital_scientist/presentation/widget/spot_test_widget.dart';
import 'package:digital_scientist/routing/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../data/services/admob_service.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
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
              height: 10.h,
            ),
            _banner == null
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(left: 0.w, top: 5.h, bottom: 10.h),
                    child: SizedBox(
                      height: 50.h,
                      width: 320.w,
                      child: AdWidget(
                        ad: _banner!,
                      ),
                    ),
                  ),
            SpotTestCategory(
              title: 'Conversion',
              iconPath: 'convert.png',
              onTap: () {
                Navigator.of(context).pushNamed(RouteManager.conversionScreen);
              },
              height: 150,
              weight: 200,
              imageHeight: 100,
              imageWeight: 100,
              customFontSize: 15,
            ),
            SizedBox(
              height: 50.h,
            ),
            SpotTestCategory(
              title: 'Reagent Preparation',
              iconPath: 'bulb.png',
              onTap: () {
                Navigator.of(context).pushNamed(RouteManager.conversionScreen2);
              },
              height: 150,
              weight: 200,
              imageHeight: 100,
              imageWeight: 100,
              customFontSize: 15,
            ),
            SizedBox(
              height: 5.h,
            ),
            _banner2 == null
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(left: 0.w, top: 5.h, bottom: 15.h),
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
