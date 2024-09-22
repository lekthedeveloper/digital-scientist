import 'package:digital_scientist/presentation/widget/header_widget.dart';
import 'package:digital_scientist/presentation/widget/spot_test_widget.dart';
import 'package:digital_scientist/routing/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../data/services/admob_service.dart';

class ConversionCalculatorScreen2 extends StatefulWidget {
  const ConversionCalculatorScreen2({super.key});

  @override
  State<ConversionCalculatorScreen2> createState() =>
      _ConversionCalculatorScreen2State();
}

class _ConversionCalculatorScreen2State
    extends State<ConversionCalculatorScreen2> {
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
      backgroundColor: const Color(0xffF5F9FF),
      body: Column(
        children: [
          const HeaderWidget(headerType: 'Type-2'),
          SizedBox(
            height: 20.h,
          ),
          _banner == null
              ? Container()
              : Padding(
                  padding: EdgeInsets.only(left: 0.w, top: 10.h),
                  child: SizedBox(
                    height: 100.h,
                    width: 320.w,
                    child: AdWidget(
                      ad: _banner!,
                    ),
                  ),
                ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 30.w,
              ),
              SpotTestCategory(
                title: 'Dilution',
                weight: 300,
                iconPath: 'drops.png',
                padding: 4,
                onTap: () {
                  Navigator.of(context).pushNamed(RouteManager.dilutionScreen);
                },
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 30.w,
              ),
              SpotTestCategory(
                title: 'Molarity(M)',
                iconPath: 'potions.png',
                weight: 300,
                padding: 4,
                onTap: () {
                  Navigator.of(context).pushNamed(RouteManager.molarityScreen);
                },
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          _banner2 == null
              ? Container()
              : Padding(
                  padding: EdgeInsets.only(left: 0.w, top: 10.h),
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
    );
  }
}
