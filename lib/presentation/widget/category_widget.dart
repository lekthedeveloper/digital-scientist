import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  final Color? backgroundColor;
  final int? height;
  final int? width;
  final String? label;
  final VoidCallback tapFunction;
  const CategoryWidget(
      {super.key,
      required this.label,
      required this.backgroundColor,
      required this.height,
      required this.width,
      required this.tapFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapFunction,
      child: Container(
        height: height!.h,
        width: width!.w,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            label!,
            style: TextStyle(
                fontFamily: 'inter',
                fontSize: 12.sp,
                color: const Color(0xff202244),
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
