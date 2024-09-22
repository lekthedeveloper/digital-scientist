import 'package:digital_scientist/presentation/widget/category_widget.dart';
import 'package:digital_scientist/presentation/widget/header_widget.dart';
import 'package:digital_scientist/presentation/widget/pageview_indicator.dart';
import 'package:digital_scientist/routing/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> texts = ["Text 1", "Text 2", "Text 3", "Text 3", "Text 3"];

  final PageController _controller = PageController();

  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AnimationLimiter(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(child: widget)),
              ),
              children: [
                const HeaderWidget(
                  headerType: 'Type-1',
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: 190.w, top: 20.h, bottom: 10.h),
                  child: Text(
                    'Lets Start Learning!',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter'),
                  ),
                ),
                Container(
                  height: 180.h,
                  width: 330.w,
                  decoration: BoxDecoration(
                      color: const Color(0xff1A6EFC),
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    children: [
                      Positioned(
                          left: 10.w,
                          top: 10.h,
                          child: SizedBox(
                            height: 170.h,
                            width: 310.w,
                            child: PageView.builder(
                                controller: _controller,
                                itemCount: texts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Text(texts[index]);
                                }),
                          )),
                      Positioned(
                          top: 10.h,
                          left: 240.w,
                          child: Container(
                            height: 30.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                color: const Color(0xffE6E6E6),
                                borderRadius: BorderRadius.circular(18)),
                            child: Image.asset(
                              'assets/images/logo_min.png',
                            ),
                          )),
                      Positioned(
                          top: 170.h,
                          left: 120.w,
                          child: PageViewIndicator(
                              selectedList: texts, selectedPage: _currentPage))
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: 230.w, bottom: 10.h, top: 20.h),
                  child: Text(
                    'Learning Paths',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Jost'),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30.w),
                      child: CategoryWidget(
                          label: 'Hematology',
                          backgroundColor: const Color(0xffC9A4F8),
                          height: 50,
                          width: 150,
                          tapFunction: () {
                            Navigator.of(context).pushNamed(
                                RouteManager.topicScreen,
                                arguments: {'title': 'Hematology'});
                          }),
                    ),
                    CategoryWidget(
                        label: 'Histopathology',
                        backgroundColor: const Color(0xffADDEBE),
                        height: 50,
                        width: 150,
                        tapFunction: () {
                          Navigator.of(context).pushNamed(
                              RouteManager.topicScreen,
                              arguments: {'title': 'Histopathology'});
                        })
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 30.w),
                        child: CategoryWidget(
                            label: 'Medical\n Microbiology',
                            backgroundColor: const Color(0xffE7BCBC),
                            height: 50,
                            width: 150,
                            tapFunction: () {
                              Navigator.of(context).pushNamed(
                                  RouteManager.topicScreen,
                                  arguments: {'title': 'Medical Microbiology'});
                            })),
                    CategoryWidget(
                        label: 'Clinical\n Chemistry',
                        backgroundColor: const Color(0xff92B0E3),
                        height: 50,
                        width: 150,
                        tapFunction: () {
                          Navigator.of(context).pushNamed(
                              RouteManager.topicScreen,
                              arguments: {'title': 'Clinical Chemistry'});
                        })
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CategoryWidget(
                    label: 'Quality Management System',
                    backgroundColor: const Color(0xffF6D4B7),
                    height: 50,
                    width: 330,
                    tapFunction: () {
                      Navigator.of(context).pushNamed(RouteManager.topicScreen,
                          arguments: {'title': 'Quality Management System'});
                    }),
                SizedBox(
                  height: 10.h,
                ),
                CategoryWidget(
                    label: 'Blood Transfusion Science',
                    backgroundColor: const Color(0xff9DC3D6),
                    height: 50,
                    width: 330,
                    tapFunction: () {
                      Navigator.of(context).pushNamed(RouteManager.topicScreen,
                          arguments: {'title': 'Blood Transfusion Science'});
                    }),
              ],
            )),
      ),
    );
  }
}
