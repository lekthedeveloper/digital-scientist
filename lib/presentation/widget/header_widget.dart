import 'package:digital_scientist/routing/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  final String? headerType;
  final bool disableBackButton;
  const HeaderWidget(
      {super.key, required this.headerType, this.disableBackButton = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: Row(
        children: [
          Visibility(
            visible: headerType == 'Type-2',
            child: Padding(
              padding: EdgeInsets.only(left: 19.w, right: 100.w),
              child: disableBackButton == true
                  ? SizedBox(
                      width: 20.w,
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SizedBox(
                        height: 25.h,
                        width: 25.w,
                        child: Image.asset('assets/icons/back.png'),
                      ),
                    ),
            ),
          ),
          Padding(
              padding:
                  EdgeInsets.only(left: headerType == 'Type-1' ? 140.w : 0.w),
              child: Image.asset('assets/images/logo.png')),
          Visibility(
            visible: headerType == 'Type-1',
            child: Padding(
              padding: EdgeInsets.only(left: 80.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(RouteManager.notificationScreen);
                },
                child: SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: Image.asset('assets/icons/notification.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
