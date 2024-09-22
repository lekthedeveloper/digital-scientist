import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpotTestCategory extends StatelessWidget {
  final String? title;
  final String? iconPath;
  final double? padding;
  final double? height;
  final double? weight;
  final double? imageHeight;
  final double? imageWeight;
  final double? customFontSize;
  final VoidCallback onTap;
  const SpotTestCategory(
      {super.key,
      required this.title,
      required this.iconPath,
      this.padding = 0,
      required this.onTap,
      this.imageHeight = 50,
      this.imageWeight = 50,
      this.customFontSize = 12,
      this.height = 100,
      this.weight = 130});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height!.h,
        width: weight!.w,
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
                height: imageHeight!.h,
                width: imageWeight!.w,
                child: Image.asset('assets/icons/$iconPath')),
            Padding(
              padding: EdgeInsets.only(top: padding!.h),
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: customFontSize!.sp,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
