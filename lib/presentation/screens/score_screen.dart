import 'package:confetti/confetti.dart';
import 'package:digital_scientist/presentation/widget/header_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../business_logic/navigation/bottom_navigation_provider.dart';
import '../../data/services/admob_service.dart';

class ResultScreen extends StatefulWidget {
  final String? score;
  const ResultScreen({super.key, required this.score});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late ConfettiController _confettiController;
  BannerAd? _banner;
  InterstitialAd? _interstitialAd;
  void _createBannerAds() {
    _banner = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: AdmobService.bannerAdsUnitId!,
        listener: AdmobService.bannerAdListener,
        request: const AdRequest())
      ..load();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdmobService.interstitialAdUnitId!,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('InterstitialAd loaded');
          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
          setState(() {
            _interstitialAd = null;
          });
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          debugPrint('InterstitialAd dismissed');

          Navigator.popUntil(context, (route) => route.isFirst);
          ad.dispose();
          // Load another ad
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          debugPrint('InterstitialAd failed to show: $error');
          ad.dispose();
          Navigator.popUntil(context, (route) => route.isFirst);
        },
      );
      _interstitialAd!.show();
      setState(() {
        _interstitialAd = null;
      });
    } else {
      debugPrint('InterstitialAd not ready to be shown');
    }
  }

  // _createRewardVideo() {
  //   RewardedAd.load(
  //       adUnitId: AdmobService.rewardedAdUnitId!,
  //       request: const AdRequest(),
  //       rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad) {
  //         setState(() {});
  //       }, onAdFailedToLoad: (error) {
  //         setState(() {});
  //       }));
  // }

  // _showRewardAd() {
  //   if (_rewardedAd != null) {
  //     _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
  //       onAdDismissedFullScreenContent: (ad) {
  //         ad.dispose();
  //         _createRewardVideo();
  //       },
  //       onAdFailedToShowFullScreenContent: (ad, error) {
  //         ad.dispose();
  //         _createRewardVideo();
  //       },
  //     );
  //     _rewardedAd.show(onUserEarnedReward: onUserEarnedReward)
  //   }
  // }

  @override
  void initState() {
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));
    _confettiController.play();
    _createBannerAds();
    // _createRewardVideo();
    _createInterstitialAd();
    super.initState();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F9FF),
        body: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand, // Ensuring the stack expands to fill the screen
          children: [
            Positioned(
              top: 10.h,
              child: const HeaderWidget(
                headerType: 'Type-2',
                disableBackButton: true,
              ),
            ),
            Positioned(
              top: 100.h,
              left: 50.w,
              child: SizedBox(
                height: 200.h,
                width: 250.w,
                child: Image.asset('assets/icons/trophy.png'),
              ),
            ),
            Positioned(
              top: 360.h,
              left: 80.w,
              child: Container(
                height: 120.h,
                width: 200.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffFDB870),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
                      child: Text(
                        'Congratulations',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '${widget.score}/100',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 535.h,
              left: 20.w,
              child: _banner == null
                  ? Container()
                  : SizedBox(
                      height: 50.h,
                      width: 320.w,
                      child: AdWidget(ad: _banner!),
                    ),
            ),
            Positioned(
              top: 610.h,
              left: 80.w,
              child: Consumer<BottomNavProvider>(
                builder: (context, value, child) => GestureDetector(
                  onTap: () {
                    value.resetIndex();
                    _showInterstitialAd();
                  },
                  child: Container(
                    height: 50.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      'Done',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
              ),
            ),
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality:
                  BlastDirectionality.explosive, // Explosive directionality
              maxBlastForce: 5, // Set a maximum blast force
              minBlastForce: 2, // Minimum blast force
              particleDrag: 0.01, // Apply drag to the confetti
              emissionFrequency: 0.6, // Frequency of emission
              numberOfParticles: 2, // Number of particles to emit
              gravity: 0.1, // More gravity means faster falling
              shouldLoop: true,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // Colors of the confetti
            ),
          ],
        ));
  }
}
