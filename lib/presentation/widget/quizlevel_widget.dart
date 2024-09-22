import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizLevel extends StatelessWidget {
  final String? levelName;
  final bool textLeftAlignment;
  final String? iconTitle;
  final bool rotateImage;
  final double? textRightPadding;
  final double? textLeftPadding;
  final VoidCallback function;
  const QuizLevel(
      {super.key,
      required this.levelName,
      this.textLeftAlignment = true,
      this.textLeftPadding = 5.0,
      this.textRightPadding = 5.0,
      required this.function,
      this.rotateImage = true,
      required this.iconTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: textLeftAlignment,
          child: Padding(
            padding: EdgeInsets.only(top: 10.h, right: textRightPadding!.w),
            child: Text(
              levelName!,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        GestureDetector(
          onTap: function,
          child: Container(
            height: 90.h,
            width: 90.w,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xffFDB870)),
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Container(
                height: 50.h,
                width: 50.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blueAccent),
                    child: rotateImage == true
                        ? Transform.rotate(
                            angle: 3.94,
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Image.asset('assets/icons/$iconTitle'),
                            ))
                        : Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Image.asset('assets/icons/$iconTitle'),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: textLeftAlignment == false,
          child: Padding(
            padding: EdgeInsets.only(top: 10.h, left: textLeftPadding!.w),
            child: Text(
              levelName!,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
