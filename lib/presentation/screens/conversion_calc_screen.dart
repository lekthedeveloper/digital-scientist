import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../data/services/admob_service.dart';

class ConversionCalculatorScreen extends StatefulWidget {
  const ConversionCalculatorScreen({super.key});

  @override
  State<ConversionCalculatorScreen> createState() =>
      _ConversionCalculatorScreenState();
}

class _ConversionCalculatorScreenState
    extends State<ConversionCalculatorScreen> {
  BannerAd? _banner;
  final _absOftest = TextEditingController();
  final _absOfStandard = TextEditingController();
  final _concOfStandard = TextEditingController();
  final convertFrom = TextEditingController();
  double convertTo = 0;
  double consOfTestResult = 0.0;
  Color activeBorder = Colors.blueAccent;
  String activeBorderCondition = '';
  List activeTextForm = [false, false, false, false, false];
  bool conIconSwap = false;
  bool conIconSwap2 = false;

  String selectedOptionFrom = '';
  String selectedOptionTo = '';
  final _formKey = GlobalKey<FormState>();
  void _createBannerAds() {
    _banner = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: AdmobService.bannerAdsUnitId!,
        listener: AdmobService.bannerAdListener,
        request: const AdRequest())
      ..load();
  }

  String _getDropdownMenuItemText(String value) {
    switch (value) {
      case 'g/L':
        return 'Grams per liter (g/L)';
      case 'g/dL':
        return 'Grams per deciliter (g/dl)';
      case 'mg/L':
        return 'Milligrams per liter (mg/L)';
      case 'mg/dL':
        return 'Milligrams per deciliter (mg/dl)';
      case 'µg/L':
        return 'Micrograms per liter (µg/L)';
      case 'µg/dL':
        return 'Micrograms per deciliter (µg/dl)';
      default:
        return '';
    }
  }

  String _getDropdownMenuItemText2(String value) {
    switch (value) {
      case 'g/L':
        return 'Grams per liter (g/L)';
      case 'g/dL':
        return 'Grams per deciliter (g/dl)';
      case 'mg/L':
        return 'Milligrams per liter (mg/L)';
      case 'mg/dL':
        return 'Milligrams per deciliter (mg/dl)';
      case 'µg/L':
        return 'Micrograms per liter (µg/L)';
      case 'µg/dL':
        return 'Micrograms per deciliter (µg/dl)';
      default:
        return '';
    }
  }

  void convertMassConcentration(String from, String to, double digit) {
    if (from == 'g/L' && to == 'g/dL') {
      setState(() {
        convertTo = digit * 10;
      });
    } else if (from == 'g/dL' && to == 'g/L') {
      setState(() {
        convertTo = digit / 10;
      });
    } else if (from == 'g/L' && to == 'mg/L') {
      setState(() {
        convertTo = digit * 1000;
      });
    } else if (from == 'g/L' && to == 'mg/dL') {
      setState(() {
        convertTo = digit * 100;
      });
    } else if (from == 'g/L' && to == 'µg/L') {
      setState(() {
        convertTo = digit * 1e6;
      });
    } else if (from == 'g/L' && to == 'µg/dL') {
      setState(() {
        convertTo = digit * 1e5;
      });
    } else if (from == 'g/dL' && to == 'mg/L') {
      setState(() {
        convertTo = digit * 100;
      });
    } else if (from == 'g/dL' && to == 'mg/dL') {
      setState(() {
        convertTo = digit * 10;
      });
    } else if (from == 'g/dL' && to == 'µg/L') {
      setState(() {
        convertTo = digit * 1e5;
      });
    } else if (from == 'g/dL' && to == 'µg/dL') {
      setState(() {
        convertTo = digit * 1e4;
      });
    } else if (from == 'mg/L' && to == 'g/L') {
      setState(() {
        convertTo = digit / 1000;
      });
    } else if (from == 'mg/L' && to == 'g/dL') {
      setState(() {
        convertTo = digit / 100;
      });
    } else if (from == 'mg/L' && to == 'mg/dL') {
      setState(() {
        convertTo = digit / 10;
      });
    } else if (from == 'mg/L' && to == 'µg/L') {
      setState(() {
        convertTo = digit * 1000;
      });
    } else if (from == 'mg/L' && to == 'µg/dL') {
      setState(() {
        convertTo = digit * 100;
      });
    } else if (from == 'mg/dL' && to == 'g/L') {
      setState(() {
        convertTo = digit / 100;
      });
    } else if (from == 'mg/dL' && to == 'g/dL') {
      setState(() {
        convertTo = digit / 10;
      });
    } else if (from == 'mg/dL' && to == 'mg/L') {
      setState(() {
        convertTo = digit * 10;
      });
    } else if (from == 'mg/dL' && to == 'µg/L') {
      setState(() {
        convertTo = digit * 1000;
      });
    } else if (from == 'mg/dL' && to == 'µg/dL') {
      setState(() {
        convertTo = digit * 100;
      });
    } else if (from == 'µg/dL' && to == 'g/L') {
      setState(() {
        convertTo = digit / 1e5;
      });
    } else if (from == 'µg/dL' && to == 'g/dL') {
      setState(() {
        convertTo = digit / 1e4;
      });
    } else if (from == 'µg/dL' && to == 'mg/L') {
      setState(() {
        convertTo = digit / 1000;
      });
    } else if (from == 'µg/dL' && to == 'mg/dL') {
      setState(() {
        convertTo = digit / 100;
      });
    } else if (from == 'µg/L' && to == 'g/L') {
      setState(() {
        convertTo = digit / 1e6;
      });
    } else if (from == 'µg/L' && to == 'g/dL') {
      setState(() {
        convertTo = digit / 1e5;
      });
    } else if (from == 'µg/L' && to == 'mg/L') {
      setState(() {
        convertTo = digit / 1000;
      });
    } else if (from == 'µg/L' && to == 'mg/dL') {
      setState(() {
        convertTo = digit / 100;
      });
    } else if (from == 'µg/L' && to == 'µg/dL') {
      setState(() {
        convertTo = digit * 10;
      });
    } else {
      setState(() {
        convertTo = 0;
      });
    }
  }

  double calculateTestConcentration(double absorbanceTest,
      double absorbanceStandard, double concentrationStandard) {
    if (absorbanceStandard == 0) {
      throw ArgumentError('Absorbance of the standard cannot be zero.');
    }
    return (absorbanceTest / absorbanceStandard) * concentrationStandard;
  }

  @override
  void initState() {
    _createBannerAds();
    super.initState();
  }

  @override
  void dispose() {
    _absOftest.dispose();
    _absOfStandard.dispose();
    _concOfStandard.dispose();
    convertFrom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(activeBorderCondition.toString());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffF5F9FF),
        titleSpacing: 15.w,
        leadingWidth: 68,
        forceMaterialTransparency: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SizedBox(
            height: 5.h,
            width: 5.w,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset('assets/icons/back.png'),
            ),
          ),
        ),
        title: Padding(
            padding: EdgeInsets.only(left: 75.w),
            child: Image.asset('assets/images/logo.png')),
      ),
      backgroundColor: const Color(0xffF5F9FF),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 15.w, top: 10.h),
          child: Column(
            children: [
              Container(
                width: 150.h,
                height: 36.h,
                decoration: BoxDecoration(
                    color: const Color(0xffFDB870),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                    child: Text(
                  'CONVERSION',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 190.h,
                width: 330.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: activeBorderCondition == 'act1'
                              ? Colors.blueAccent
                              : Colors.transparent,
                          blurRadius: BorderSide.strokeAlignCenter,
                          spreadRadius: 3,
                          blurStyle: BlurStyle.outer,
                          offset: const Offset(1, 3))
                    ]),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 75.w,
                        ),
                        Container(
                          height: 25.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(146, 64, 123, 226),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text(
                              'Concentration of test:',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (conIconSwap == true) {
                              _absOftest.clear();
                              _absOfStandard.clear();
                              _concOfStandard.clear();
                              consOfTestResult = 0;
                            }
                            setState(() {
                              activeBorderCondition = 'act1';
                              activeTextForm[0] = false;
                              activeTextForm[1] = false;
                              activeTextForm[2] = false;
                              activeTextForm[3] = false;
                              conIconSwap = !conIconSwap;
                              try {
                                double testConcentration =
                                    calculateTestConcentration(
                                        double.parse(_absOftest.text),
                                        double.parse(_absOfStandard.text),
                                        double.parse(_concOfStandard.text));

                                setState(() {
                                  consOfTestResult = testConcentration;
                                });
                              } catch (e) {
                                debugPrint('Error: ${e.toString()}');
                              }
                            });
                          },
                          child: Container(
                            height: 35.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image.asset(
                                conIconSwap == false
                                    ? 'assets/icons/click-here.png'
                                    : 'assets/icons/reset.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 70.w),
                          child: Container(
                            height: 19.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text(
                                'Absorbance of test',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: 20.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: activeTextForm[0] == true
                                        ? Colors.blueAccent
                                        : Colors.transparent,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(5),
                                color: const Color.fromARGB(146, 64, 123, 226)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                              child: TextFormField(
                                controller: _absOftest,
                                cursorColor: Colors.transparent,
                                keyboardType: TextInputType.number,
                                onTap: () {
                                  setState(() {
                                    activeBorderCondition = 'act1';
                                    activeTextForm[0] = true;
                                    activeTextForm[1] = false;
                                    activeTextForm[2] = false;
                                    activeTextForm[3] = false;
                                  });
                                },
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 4, 37, 92)),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 70.w),
                          child: Container(
                            height: 19.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text(
                                'Absorbance of standard',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: 20.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(146, 64, 123, 226),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: activeTextForm[1] == true
                                      ? Colors.blueAccent
                                      : Colors.transparent,
                                  width: 2.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                              child: TextFormField(
                                controller: _absOfStandard,
                                cursorColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    activeBorderCondition = 'act1';
                                    activeTextForm[0] = false;
                                    activeTextForm[1] = true;
                                    activeTextForm[2] = false;
                                    activeTextForm[3] = false;
                                  });
                                },
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 4, 37, 92)),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 70.w),
                          child: Container(
                            height: 19.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Conc. of standard',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: 20.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(146, 64, 123, 226),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: activeTextForm[2] == true
                                      ? Colors.blueAccent
                                      : Colors.transparent,
                                  width: 2.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                              child: TextFormField(
                                controller: _concOfStandard,
                                cursorColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    activeBorderCondition = 'act1';
                                    activeTextForm[0] = false;
                                    activeTextForm[1] = false;
                                    activeTextForm[2] = true;
                                    activeTextForm[3] = false;
                                  });
                                },
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 4, 37, 92)),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 70.w),
                          child: Container(
                            height: 19.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text(
                                'Conc. of test',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: 20.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(146, 64, 123, 226),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Center(
                                    child: Text(consOfTestResult == 0.0
                                        ? ''
                                        : consOfTestResult
                                            .toStringAsFixed(1)))))
                      ],
                    )
                  ],
                ),
              ),
              _banner == null
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.only(left: 0.w, top: 10.h),
                      child: SizedBox(
                        height: 100.h,
                        width: 320.w,
                        child: AdWidget(
                          ad: _banner!,
                        ),
                      ),
                    ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 190.h,
                width: 330.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: activeBorderCondition == 'act2'
                              ? Colors.blueAccent
                              : Colors.transparent,
                          blurRadius: BorderSide.strokeAlignCenter,
                          spreadRadius: 3,
                          blurStyle: BlurStyle.outer,
                          offset: const Offset(1, 3))
                    ]),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 75.w,
                        ),
                        Container(
                          height: 25.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(146, 64, 123, 226),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text(
                              'Convert from:',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (conIconSwap2 == true) {
                                convertFrom.clear();
                                convertTo = 0.0;
                              }
                              activeBorderCondition = 'act2';
                              conIconSwap2 = !conIconSwap2;
                              activeTextForm[0] = false;
                              activeTextForm[1] = false;
                              activeTextForm[2] = false;
                              activeTextForm[3] = false;
                              convertMassConcentration(
                                  selectedOptionFrom,
                                  selectedOptionTo,
                                  double.parse(convertFrom.text));
                            });
                          },
                          child: Container(
                            height: 35.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                conIconSwap2 == false
                                    ? 'assets/icons/click-here.png'
                                    : 'assets/icons/reset.png',
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 60.w),
                          child: Container(
                            height: 26.h,
                            width: 180.w,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 8.w,
                              ),
                              child: DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                iconEnabledColor: Colors.white,
                                iconDisabledColor: Colors.white,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: -7.h),
                                    border: InputBorder.none),
                                hint: Text(
                                  'Select SI Unit',
                                  style: TextStyle(
                                    fontFamily: 'Poppins Regular',
                                    color: Colors.white,
                                    fontSize: 9.sp,
                                  ),
                                ),
                                items: [
                                  DropdownMenuItem(
                                    value: 'g/L',
                                    child: Text(
                                      'Grams per liter (g/L)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins Regular',
                                          fontSize: 9.sp,
                                          color: selectedOptionFrom == 'g/L'
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'g/dL',
                                    child: Text(
                                      'Grams per deciliter (g/dl)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins Regular',
                                          fontSize: 9.sp,
                                          color: selectedOptionFrom == 'g/dl'
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'mg/L',
                                    child: Text(
                                      'Milligrams per liter (mg/L)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins Regular',
                                          fontSize: 9.sp,
                                          color: selectedOptionFrom == 'mg/L'
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'mg/dL',
                                    child: Text(
                                      'Milligrams per deciliter (mg/dl)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins Regular',
                                          fontSize: 9.sp,
                                          color: selectedOptionFrom == 'mg/dl'
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'µg/L',
                                    child: Text(
                                      'Micrograms per liter (µg/L)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins Regular',
                                          fontSize: 9.sp,
                                          color: selectedOptionFrom == 'µg/L'
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'µg/dL',
                                    child: Text(
                                      'Micrograms per deciliter (µg/dl)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins Regular',
                                          fontSize: 9.sp,
                                          color: selectedOptionFrom == 'µg/dl'
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  )
                                ],
                                onTap: () {
                                  setState(() {
                                    activeBorderCondition = 'act2';
                                    activeTextForm[0] = false;
                                    activeTextForm[1] = false;
                                    activeTextForm[2] = false;
                                    activeTextForm[3] = false;
                                  });
                                },
                                value: selectedOptionFrom.isEmpty
                                    ? null
                                    : selectedOptionFrom,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOptionFrom = value!;
                                  });
                                },
                                selectedItemBuilder: (BuildContext context) {
                                  return [
                                    'g/L',
                                    'g/dL',
                                    'mg/L',
                                    'mg/dL',
                                    'µg/L',
                                    'µg/dL',
                                  ].map((String value) {
                                    return Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        _getDropdownMenuItemText(value),
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: 20.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(146, 64, 123, 226),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: activeTextForm[3] == true
                                        ? Colors.blueAccent
                                        : Colors.transparent,
                                    width: 2)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                              child: TextFormField(
                                controller: convertFrom,
                                onTap: () {
                                  setState(() {
                                    activeBorderCondition = 'act2';
                                    activeTextForm[0] = false;
                                    activeTextForm[1] = false;
                                    activeTextForm[2] = false;
                                    activeTextForm[3] = true;
                                  });
                                },
                                cursorColor: Colors.transparent,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 4, 37, 92)),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ),
                            ))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                      child: Container(
                        height: 20.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(131, 253, 185, 112),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            'To',
                            style: TextStyle(
                                fontFamily: 'Inter ',
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 60.w),
                          child: Container(
                            height: 26.h,
                            width: 180.w,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 8.w,
                              ),
                              child: DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                iconEnabledColor: Colors.white,
                                iconDisabledColor: Colors.white,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: -7.h),
                                    border: InputBorder.none),
                                onTap: () {
                                  setState(() {
                                    activeBorderCondition = 'act2';
                                    activeTextForm[3] = false;
                                  });
                                },
                                hint: Text(
                                  'Select SI Unit',
                                  style: TextStyle(
                                    fontFamily: 'Poppins Regular',
                                    color: Colors.white,
                                    fontSize: 9.sp,
                                  ),
                                ),
                                items: [
                                  DropdownMenuItem(
                                    value: 'g/L',
                                    child: Text(
                                      'Grams per liter (g/L)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins Regular',
                                          fontSize: 9.sp,
                                          color: selectedOptionTo == 'g/L'
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'g/dL',
                                    child: Text(
                                      'Grams per deciliter (g/dl)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins Regular',
                                          fontSize: 9.sp,
                                          color: selectedOptionTo == 'g/dl'
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'mg/L',
                                    child: Text(
                                      'Milligrams per liter (mg/L)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins Regular',
                                          fontSize: 9.sp,
                                          color: selectedOptionTo == 'mg/L'
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'mg/dL',
                                    child: Text(
                                      'Milligrams per deciliter (mg/dl)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins Regular',
                                          fontSize: 9.sp,
                                          color: selectedOptionTo == 'mg/dl'
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'µg/L',
                                    child: Text(
                                      'Micrograms per liter (µg/L)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins Regular',
                                          fontSize: 9.sp,
                                          color: selectedOptionTo == 'µg/L'
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'µg/dL',
                                    child: Text(
                                      'Micrograms per deciliter (µg/dl)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins Regular',
                                          fontSize: 9.sp,
                                          color: selectedOptionTo == 'µg/dl'
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  )
                                ],
                                value: selectedOptionTo.isEmpty
                                    ? null
                                    : selectedOptionTo,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOptionTo = value!;
                                  });
                                },
                                selectedItemBuilder: (BuildContext context) {
                                  return [
                                    'g/L',
                                    'g/dL',
                                    'mg/L',
                                    'mg/dL',
                                    'µg/L',
                                    'µg/dL',
                                  ].map((String value) {
                                    return Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        _getDropdownMenuItemText2(value),
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: 20.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(146, 64, 123, 226),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Center(
                                    child: Text(
                                  convertTo == 0
                                      ? convertTo.toString()
                                      : convertTo.toString(),
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromARGB(255, 4, 37, 92)),
                                ))))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
