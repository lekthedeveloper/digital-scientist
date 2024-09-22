import 'dart:async';

import 'package:digital_scientist/data/models/topic_model.dart';
import 'package:digital_scientist/presentation/widget/header_widget.dart';
import 'package:digital_scientist/routing/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';

import '../../data/services/admob_service.dart';

class TopicScreen extends StatefulWidget {
  final String? title;
  const TopicScreen({super.key, required this.title});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  bool showSpinner = true;
  BannerAd? _banner;
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
    Timer(const Duration(seconds: 2), () {
      setState(() {
        showSpinner = false;
      });
    });
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
            showSpinner
                ? SizedBox(
                    height: 50.h,
                  )
                : SizedBox(
                    height: 20.h,
                  ),
            showSpinner
                ? LottieBuilder.asset('assets/lottie/loading.json')
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: widget.title!.length > 18 ? 50.w : 80.w),
                        child: Container(
                          width: widget.title!.length > 18 ? 250.w : 200.w,
                          height: 40.h,
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
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: Text(
                          'Topic',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                          height: 430.h,
                          width: 350.w,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemCount: topics['Heamatology']['topic'].length,
                            padding: const EdgeInsets.all(0),
                            itemBuilder: (context, index) {
                              final topic = topics['Heamatology']['topic']
                                  .keys
                                  .elementAt(index);
                              return Padding(
                                padding:
                                    EdgeInsets.only(left: 30.w, right: 30.w),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        RouteManager.writeupScreen,
                                        arguments: {
                                          'data': topics['Heamatology']['topic']
                                              [topic]
                                        });
                                  },
                                  child: Container(
                                    width: 100.h,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                        child: Text(
                                      topic,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              height: 15.h,
                            ),
                          )),
                      _banner == null
                          ? Container()
                          : Padding(
                              padding: EdgeInsets.only(left: 15.w, top: 10.h),
                              child: SizedBox(
                                height: 50.h,
                                width: 320.w,
                                child: AdWidget(
                                  ad: _banner!,
                                ),
                              ),
                            ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
