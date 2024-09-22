import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../data/services/admob_service.dart';

class DilutionScreen extends StatefulWidget {
  const DilutionScreen({super.key});

  @override
  State<DilutionScreen> createState() => _DilutionScreenState();
}

class _DilutionScreenState extends State<DilutionScreen> {
  BannerAd? _banner;
  final _formKey = GlobalKey<FormState>();
  final _requiredConcentration = TextEditingController();
  final _requiredVolume = TextEditingController();
  final _originalConcentration = TextEditingController();
  final _percentRequiredVol = TextEditingController();
  final _requiredPercent = TextEditingController();
  double volumeOfStockSol = 0;
  double volumeOfDiluent = 0;
  double weighRequiredVol = 0;
  double mlOfDiluent = 0;
  List activeTextForm = [false, false, false, false, false];
  String activeBorderCondition = '';
  bool conIconSwap = false;
  bool conIconSwap2 = false;
  void _createBannerAds() {
    _banner = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: AdmobService.bannerAdsUnitId!,
        listener: AdmobService.bannerAdListener,
        request: const AdRequest())
      ..load();
  }

  calculateStockSolutionVolume(double requiredConcentration,
      double requiredVolume, double originalConcentration) {
    setState(() {
      volumeOfStockSol =
          (requiredConcentration * requiredVolume) / originalConcentration;
      volumeOfDiluent =
          volumeOfStockSol - double.parse(_originalConcentration.text);
    });
  }

  calculateGramsOfSolute(double requiredPercent, double requiredVolume) {
    setState(() {
      mlOfDiluent = (requiredPercent / 100) * requiredVolume;
      weighRequiredVol = double.parse(_percentRequiredVol.text);
    });
  }

  @override
  void initState() {
    _createBannerAds();
    super.initState();
  }

  @override
  void dispose() {
    _requiredConcentration.dispose();
    _requiredVolume.dispose();
    _originalConcentration.dispose();
    _percentRequiredVol.dispose();
    _requiredPercent.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F9FF),
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
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 15.w, top: 10.h),
          child: Column(
            children: [
              Container(
                height: 210.h,
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
                              'Dilution:',
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
                            activeTextForm[0] = false;
                            activeTextForm[1] = false;
                            activeTextForm[2] = false;
                            activeTextForm[3] = false;
                            activeTextForm[4] = false;

                            if (conIconSwap == true) {
                              _requiredConcentration.clear();
                              _requiredVolume.clear();
                              _originalConcentration.clear();
                              setState(() {
                                volumeOfStockSol = 0;
                                volumeOfDiluent = 0;
                              });
                            } else if (conIconSwap == false) {
                              setState(() {
                                conIconSwap = !conIconSwap;
                                calculateStockSolutionVolume(
                                    double.parse(_requiredConcentration.text),
                                    double.parse(_requiredVolume.text),
                                    double.parse(_originalConcentration.text));
                              });
                            }
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
                                conIconSwap == false
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
                          padding: EdgeInsets.only(left: 10.w, right: 70.w),
                          child: Container(
                            height: 19.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text(
                                'Required concentration',
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
                                  color: activeTextForm[0] == true
                                      ? Colors.blueAccent
                                      : Colors.transparent,
                                  width: 2.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                              child: TextFormField(
                                controller: _requiredConcentration,
                                cursorColor: Colors.transparent,
                                keyboardType: TextInputType.number,
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
                                onTap: () {
                                  setState(() {
                                    activeBorderCondition = 'act1';
                                    activeTextForm[0] = true;
                                    activeTextForm[1] = false;
                                    activeTextForm[2] = false;
                                    activeTextForm[3] = false;
                                    activeTextForm[4] = false;
                                  });
                                },
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
                                'Required Volume',
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
                                controller: _requiredVolume,
                                cursorColor: Colors.transparent,
                                keyboardType: TextInputType.number,
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
                                onTap: () {
                                  setState(() {
                                    activeBorderCondition = 'act1';
                                    activeTextForm[0] = false;
                                    activeTextForm[1] = true;
                                    activeTextForm[2] = false;
                                    activeTextForm[3] = false;
                                    activeTextForm[4] = false;
                                  });
                                },
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
                              border: Border.all(
                                  color: activeTextForm[1] == true
                                      ? Colors.blueAccent
                                      : Colors.transparent,
                                  width: 2.0),
                            ),
                            child: const Center(
                              child: Text(
                                'Original concentration',
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
                                controller: _originalConcentration,
                                cursorColor: Colors.transparent,
                                keyboardType: TextInputType.number,
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
                                onTap: () {
                                  setState(() {
                                    activeBorderCondition = 'act1';
                                    activeTextForm[0] = false;
                                    activeTextForm[1] = false;
                                    activeTextForm[2] = true;
                                    activeTextForm[3] = false;
                                    activeTextForm[4] = false;
                                  });
                                },
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          'Add',
                          style:
                              TextStyle(fontFamily: 'Inter', fontSize: 11.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 20.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(146, 64, 123, 226),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            volumeOfStockSol.toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 9.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 4, 37, 92)),
                          )),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'of the stock solution to',
                          style:
                              TextStyle(fontFamily: 'Inter', fontSize: 11.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 20.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(146, 64, 123, 226),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              volumeOfDiluent.toStringAsFixed(2),
                              style: TextStyle(
                                  fontSize: 9.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 4, 37, 92)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'of',
                          style:
                              TextStyle(fontFamily: 'Inter', fontSize: 11.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 260.w, top: 0.h),
                      child: Text(
                        'diluent',
                        style: TextStyle(fontFamily: 'Inter', fontSize: 11.sp),
                      ),
                    ),
                  ],
                ),
              ),
              _banner == null
                  ? Container()
                  : Padding(
                      padding:
                          EdgeInsets.only(left: 0.w, top: 20.h, bottom: 20.h),
                      child: SizedBox(
                        height: 100.h,
                        width: 320.w,
                        child: AdWidget(
                          ad: _banner!,
                        ),
                      ),
                    ),
              Container(
                height: 200.h,
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
                              'Percent Solution: (g/dl):',
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
                            if (conIconSwap2 == true) {
                              _requiredPercent.clear();
                              _percentRequiredVol.clear();
                              setState(() {
                                weighRequiredVol = 0;
                                mlOfDiluent = 0;
                              });
                            } else if (conIconSwap2 == false) {
                              calculateGramsOfSolute(
                                  double.parse(_percentRequiredVol.text),
                                  double.parse(_requiredPercent.text));
                            }

                            setState(() {
                              conIconSwap2 = !conIconSwap2;
                              activeBorderCondition = 'act2';
                              activeTextForm[0] = false;
                              activeTextForm[1] = false;
                              activeTextForm[2] = false;
                              activeTextForm[3] = false;
                              activeTextForm[4] = false;
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
                          padding: EdgeInsets.only(left: 10.w, right: 70.w),
                          child: Container(
                            height: 19.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text(
                                'Required Volume (ml)',
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
                                  color: activeTextForm[3] == true
                                      ? Colors.blueAccent
                                      : Colors.transparent,
                                  width: 2.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                              child: TextFormField(
                                controller: _percentRequiredVol,
                                cursorColor: Colors.transparent,
                                keyboardType: TextInputType.number,
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
                                onTap: () {
                                  setState(() {
                                    activeBorderCondition = 'act2';
                                    activeTextForm[0] = false;
                                    activeTextForm[1] = false;
                                    activeTextForm[2] = false;
                                    activeTextForm[3] = true;
                                    activeTextForm[4] = false;
                                  });
                                },
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
                                'Required Percent (%)',
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
                                  color: activeTextForm[4] == true
                                      ? Colors.blueAccent
                                      : Colors.transparent,
                                  width: 2.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                              child: TextFormField(
                                controller: _requiredPercent,
                                cursorColor: Colors.transparent,
                                keyboardType: TextInputType.number,
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
                                onTap: () {
                                  setState(() {
                                    activeBorderCondition = 'act2';
                                    activeTextForm[0] = false;
                                    activeTextForm[1] = false;
                                    activeTextForm[2] = false;
                                    activeTextForm[3] = false;
                                    activeTextForm[4] = true;
                                  });
                                },
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          'Weigh',
                          style:
                              TextStyle(fontFamily: 'Inter', fontSize: 11.sp),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 20.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(146, 64, 123, 226),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(weighRequiredVol.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 9.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 4, 37, 92)))),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'g of the solute and dissolve in',
                          style:
                              TextStyle(fontFamily: 'Inter', fontSize: 11.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 20.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(146, 64, 123, 226),
                          ),
                          child: Center(
                              child: Text(
                            mlOfDiluent.toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 9.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 4, 37, 92)),
                          )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 240.w, top: 2.h),
                      child: Text(
                        'ml of diluent',
                        style: TextStyle(fontFamily: 'Inter', fontSize: 11.sp),
                      ),
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
