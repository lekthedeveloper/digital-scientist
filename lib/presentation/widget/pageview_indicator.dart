import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewIndicator extends StatelessWidget {
  final List? selectedList;
  final int? selectedPage;
  const PageViewIndicator(
      {super.key, required this.selectedList, required this.selectedPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        selectedList!.length,
        (index) => Container(
          width: selectedPage == index ? 15.w : 8.0.w,
          height: 8.0.h,
          margin: EdgeInsets.symmetric(horizontal: 4.0.w),
          decoration: selectedPage == index
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffFAC840))
              : const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
