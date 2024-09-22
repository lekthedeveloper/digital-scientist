import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class QuizQuestionsWidget extends StatefulWidget {
  final List<String> quizOptions;
  final String quizQuestion;
  final String correctOption;
  String selectedOption;
  int? markObtain;
  QuizQuestionsWidget(
      {super.key,
      required this.quizOptions,
      required this.quizQuestion,
      required this.markObtain,
      required this.selectedOption,
      required this.correctOption});

  @override
  State<QuizQuestionsWidget> createState() => _QuizQuestionsWidgetState();
}

class _QuizQuestionsWidgetState extends State<QuizQuestionsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      width: 330.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: Text(
              widget.quizQuestion,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 13.sp,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
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
                            widget.markObtain = 5;
                          } else {
                            widget.markObtain = 0;
                          }
                        });
                      },
                      child: Container(
                        width: 280.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: widget.quizOptions[index] ==
                                    widget.selectedOption
                                ? Colors.green
                                : Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15.w,
                                ),
                                Expanded(
                                  flex: 11,
                                  child: Text(
                                    widget.quizOptions[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Expanded(
                                  child: widget.quizOptions[index] ==
                                          widget.selectedOption
                                      ? SizedBox(
                                          height: 15.h,
                                          width: 15.w,
                                          child: Image.asset(
                                              'assets/icons/check-mark.png'))
                                      : SizedBox(
                                          height: 15.h,
                                          width: 15.w,
                                        ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount: widget.quizOptions.length),
            ),
          )
        ],
      ),
    );
  }
}
