import 'package:digital_scientist/presentation/widget/header_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:video_player/video_player.dart';

import '../../data/services/admob_service.dart';
import '../../routing/navigation_controller.dart';

class WriteupScreen extends StatefulWidget {
  final Map<String, dynamic>? data;
  const WriteupScreen({super.key, required this.data});

  @override
  State<WriteupScreen> createState() => _WriteupScreenState();
}

class _WriteupScreenState extends State<WriteupScreen> {
  // late FlickManager flickManager;
  late VideoPlayerController _videocontroller;
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
    _videocontroller = VideoPlayerController.asset('assets/videos/health.mp4');
    _videocontroller.addListener(() {
      setState(() {});
    });
    _videocontroller.setLooping(true);
    _videocontroller.initialize().then((_) => setState(() {}));
    // flickManager = FlickManager(
    //     videoPlayerController: VideoPlayerController.networkUrl(
    //   Uri.parse(
    //       "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
    // ));
    _videocontroller.play();
    super.initState();
  }

  @override
  void dispose() {
    // flickManager.dispose();
    _videocontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderWidget(headerType: 'Type-2'),
        SizedBox(
          height: 20.h,
        ),
        // Padding(
        //   padding: EdgeInsets.only(left: 20.w),
        //   child: Container(
        //     height: 200.h,
        //     width: 320.w,
        //     color: Colors.blueGrey,
        //     child: FlickVideoPlayer(flickManager: flickManager),
        //   ),
        // ),
        Container(
          clipBehavior: Clip.none,
          height: 205.h,
          width: 400.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: _videocontroller.value.isInitialized
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AspectRatio(
                          aspectRatio: _videocontroller.value.aspectRatio,
                          child: VideoPlayer(_videocontroller),
                        ),
                      ),
                    ],
                  )
                : const CircularProgressIndicator(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 150.w, top: 10.h, bottom: 10.h),
          child: Text(
            'Outline',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: SizedBox(
            height: 250.h,
            width: 350.w,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  final topic = widget.data!['outline'].keys.elementAt(index);

                  return Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouteManager.readingScreen, arguments: {
                          'data': widget.data!['outline'][topic]
                        });
                        _videocontroller.pause();
                      },
                      child: Container(
                        width: 100.h,
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15)),
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
                itemCount: widget.data!['outline'].length),
          ),
        ),
        _banner == null
            ? Container()
            : Padding(
                padding: EdgeInsets.only(left: 5.w, top: 10.h),
                child: SizedBox(
                  height: 50.h,
                  width: 350.w,
                  child: AdWidget(
                    ad: _banner!,
                  ),
                ),
              ),
      ],
    ));
  }
}
