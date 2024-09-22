import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SpotTestQuestionsWidget extends StatefulWidget {
  final List<String> quizOptions;
  final String? imageLink;
  final String quizQuestion;
  final String correctOption;
  String selectedOption;
  int? markObtain;
  SpotTestQuestionsWidget(
      {super.key,
      required this.quizOptions,
      required this.quizQuestion,
      required this.imageLink,
      required this.markObtain,
      required this.selectedOption,
      required this.correctOption});

  @override
  State<SpotTestQuestionsWidget> createState() =>
      _SpotTestQuestionsWidgetState();
}

class _SpotTestQuestionsWidgetState extends State<SpotTestQuestionsWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420.h,
      width: 330.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            widget.quizQuestion,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13.sp,
            ),
            textAlign: TextAlign.justify,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    spreadRadius: -9,
                    blurStyle: BlurStyle.inner,
                    blurRadius: 30,
                    offset: const Offset(-10, -19),
                  ),
                ],
              ),
              height: 130.h,
              width: 300.w,
              child: Image.asset('assets/images/${widget.imageLink!}'),
            ),
          ),
          SizedBox(
            height: 250.h,
            width: 350.w,
            child: ListView.separated(
                padding: EdgeInsets.only(top: 40.h, left: 10.w, right: 10.w),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.selectedOption = widget.quizOptions[index];
                        if (widget.markObtain != null &&
                            widget.selectedOption == widget.correctOption) {
                          widget.markObtain = 20;
                        } else {
                          widget.markObtain = 0;
                        }
                      });
                    },
                    child: Container(
                      width: 280.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color:
                              widget.quizOptions[index] == widget.selectedOption
                                  ? Colors.green
                                  : Colors.blueAccent,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          widget.quizOptions[index],
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                itemCount: widget.quizOptions.length),
          )
        ],
      ),
    );
  }
}
