import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../data/services/admob_service.dart';

class MolarityScreen extends StatefulWidget {
  const MolarityScreen({super.key});

  @override
  State<MolarityScreen> createState() => _MolarityScreenState();
}

class _MolarityScreenState extends State<MolarityScreen> {
  String activeBorderCondition = '';
  bool conIconSwap = false;
  bool conIconSwap2 = false;
  BannerAd? _banner;
  String normalityOption = '';
  String molarityOption = '';
  final _mRequiredVol = TextEditingController();
  final _mRequiredMolarity = TextEditingController();
  final _mAcidSpecifedGravity = TextEditingController();
  final _nRequiredVol = TextEditingController();
  final _nRequiredNorm = TextEditingController();
  final _nSpecificGravity = TextEditingController();
  final _nPurity = TextEditingController();
  final _mPurity = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool ifAcid = false;
  bool ifAcid2 = false;
  bool selectedDroptextColor = false;
  double massofSolute = 0.0;
  double nMassofSolute = 0.0;
  double valencyValue = 0;

  calculateMassOfSolute(
      double molarity, double volume, double molecularWeight) {
    setState(() {
      massofSolute = molarity * volume * molecularWeight;
    });
  }

  calculateVolumeOfAcidNeeded(double molarity, double volumeDesired,
      double molecularWeight, double specificGravity, double purityPercentage) {
    setState(() {
      massofSolute = (molarity * volumeDesired * molecularWeight * 1000) /
          (specificGravity * purityPercentage * 10);
    });
  }

  normalityCalculateMassOfSolute(
      double normality, double volume, double valency, double molarMass) {
    setState(() {
      nMassofSolute = (normality * volume / valency) * molarMass;
    });
  }

  normalityCalculateVolumeOfAcidNeeded(double normality, double volumeDesired,
      double molecularWeight, double specificGravity, double purityPercentage) {
    setState(() {
      nMassofSolute = (normality * volumeDesired * molecularWeight * 100) /
          (specificGravity * purityPercentage * 1000);
    });
  }

// Utility function to get the item text based on value
  String _getDropdownMenuItemText(String value) {
    switch (value) {
      case '36.46':
        return 'Hydrochloric acid (HCl)';
      case '98.08':
        return 'Sulfuric acid (H₂SO₄)';
      case '63.01':
        return 'Nitric acid (HNO₃)';
      case '60.05':
        return 'Acetic acid (CH₃COOH)';
      case '40.00':
        return 'Sodium hydroxide (NaOH)';
      case '56.11':
        return 'Potassium hydroxide (KOH)';
      case '35.05':
        return 'Ammonium hydroxide (NH₄OH)';
      case '158.03':
        return 'Permanganate (KMnO₄)';
      case '169.87':
        return 'Silver nitrate (AgNO₃)';
      default:
        return '';
    }
  }

  String _getDropdownMenuItemText2(String value) {
    switch (value) {
      case '36.46':
        return 'Hydrochloric acid (HCl)';
      case '98.08':
        return 'Sulfuric acid (H₂SO₄)';
      case '63.01':
        return 'Nitric acid (HNO₃)';
      case '60.05':
        return 'Acetic acid (CH₃COOH)';
      case '40.00':
        return 'Sodium hydroxide (NaOH)';
      case '56.11':
        return 'Potassium hydroxide (KOH)';
      case '35.05':
        return 'Ammonium hydroxide (NH₄OH)';
      case '158.03':
        return 'Permanganate (KMnO₄)';
      case '169.87':
        return 'Silver nitrate (AgNO₃)';
      default:
        return '';
    }
  }

  List activeTextForm = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  void _createBannerAds() {
    _banner = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: AdmobService.bannerAdsUnitId!,
        listener: AdmobService.bannerAdListener,
        request: const AdRequest())
      ..load();
  }

  @override
  void dispose() {
    _mRequiredVol.dispose();

    _mRequiredMolarity.dispose();

    _mAcidSpecifedGravity.dispose();
    _nRequiredVol.dispose();
    _nRequiredNorm.dispose();
    _nSpecificGravity.dispose();
    _nPurity.dispose();
    _mPurity.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _createBannerAds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: 260.h,
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
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Molarity (M):',
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
                              _mRequiredVol.clear();
                              _mRequiredMolarity.clear();
                              _mPurity.clear();
                              _mAcidSpecifedGravity.clear();
                              setState(() {
                                massofSolute = 0.0;
                              });
                            } else if (conIconSwap == false) {
                              if (ifAcid == false) {
                                calculateMassOfSolute(
                                    double.parse(_mRequiredMolarity.text),
                                    double.parse(_mRequiredVol.text),
                                    double.parse(molarityOption));
                              } else if (ifAcid == true) {
                                calculateVolumeOfAcidNeeded(
                                    double.parse(_mRequiredMolarity.text),
                                    double.parse(_mRequiredVol.text),
                                    double.parse(molarityOption),
                                    double.parse(_mAcidSpecifedGravity.text),
                                    double.parse(_mPurity.text));
                              }
                            }
                            setState(() {
                              conIconSwap = !conIconSwap;
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
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 70.w),
                          child: Container(
                            height: 26.h,
                            width: 174.w,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 8.w,
                              ),
                              child: DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                // padding: EdgeInsets.only(right: 5.w),
                                iconEnabledColor: Colors.white,

                                iconDisabledColor: Colors.white,
                                menuMaxHeight: 200.h,
                                hint: Text(
                                  'Select Compound',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 9.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: -14.h),
                                  border: InputBorder.none,
                                ),
                                items: [
                                  DropdownMenuItem(
                                    enabled: false,
                                    child: Container(
                                      height: 20.h,
                                      width: 140.w,
                                      color: Colors.blueAccent.shade100,
                                      child: Center(
                                        child: Text(
                                          'Acids',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 9.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '36.46',
                                    child: Text(
                                      'Hydrochloric acid (HCl)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp,
                                          color: Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '98.08',
                                    child: Text(
                                      'Sulfuric acid (H₂SO₄)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp,
                                          color: Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '63.01',
                                    child: Text(
                                      'Nitric acid (HNO₃)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp,
                                          color: Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '60.05',
                                    child: Text(
                                      'Acetic acid (CH₃COOH)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp,
                                          color: Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    enabled: false,
                                    child: Container(
                                      height: 20.h,
                                      width: 140.w,
                                      color: Colors.blueAccent.shade100,
                                      child: Center(
                                        child: Text(
                                          'Base',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 9.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '40.00',
                                    child: Text(
                                      'Sodium hydroxide (NaOH)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp,
                                          color: Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '56.11',
                                    child: Text(
                                      'Potassium hydroxide (KOH)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp,
                                          color: Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '35.05',
                                    child: Text(
                                      'Ammonium hydroxide (NH₄OH)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp,
                                          color: Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    enabled: false,
                                    child: Container(
                                      height: 20.h,
                                      width: 140.w,
                                      color: Colors.blueAccent.shade100,
                                      child: Center(
                                        child: Text(
                                          'Titration Reagents',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 9.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '158.03',
                                    child: Text(
                                      'Permanganate (KMnO₄)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp,
                                          color: Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '169.87',
                                    child: Text(
                                      'Silver nitrate (AgNO₃)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                                value: molarityOption.isEmpty
                                    ? null
                                    : molarityOption,
                                selectedItemBuilder: (BuildContext context) {
                                  return [
                                    '',
                                    '36.46',
                                    '98.08',
                                    '63.01',
                                    '60.05',
                                    '',
                                    '40.00',
                                    '56.11',
                                    '35.05',
                                    '',
                                    '158.03',
                                    '169.87',
                                  ].map((String value) {
                                    return Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        _getDropdownMenuItemText(value),
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  }).toList();
                                },
                                onTap: () {
                                  setState(() {
                                    activeBorderCondition = 'act1';
                                  });
                                },
                                onChanged: (String? value) {
                                  setState(() {
                                    molarityOption = value!;
                                    if (ifAcid == true) {
                                      //if its acid dont toggle the button

                                      if (molarityOption == '36.46' ||
                                          molarityOption == '98.08' ||
                                          molarityOption == '63.01' ||
                                          molarityOption == '60.05') {
                                        debugPrint('its still acid');
                                      } else {
                                        if (_mRequiredMolarity.text == '' &&
                                            _mRequiredVol.text == '' &&
                                            _mAcidSpecifedGravity.text == '' &&
                                            _mPurity.text == '') {
                                          return;
                                        } else {
                                          conIconSwap = !conIconSwap;
                                        }
                                      }
                                    } else if (ifAcid == false) {
                                      //if its non acid dont toggle the button
                                      if (molarityOption == '40.00' ||
                                          molarityOption == '56.11' ||
                                          molarityOption == '35.05' ||
                                          molarityOption == '158.03' ||
                                          molarityOption == '169.87') {
                                        debugPrint('its still a non acid');
                                      } else {
                                        if (_mRequiredMolarity.text == '' &&
                                            _mRequiredVol.text == '' &&
                                            _mAcidSpecifedGravity.text == '' &&
                                            _mPurity.text == '') {
                                          return;
                                        } else {
                                          conIconSwap = !conIconSwap;
                                        }
                                      }
                                    }

                                    activeBorderCondition = 'act1';
                                    activeTextForm[0] = false;
                                    activeTextForm[1] = false;
                                    activeTextForm[2] = false;
                                    activeTextForm[3] = false;
                                    activeTextForm[4] = false;
                                    activeTextForm[5] = false;
                                    activeTextForm[6] = false;
                                    activeTextForm[7] = false;
                                  });
                                  if (molarityOption == '36.46' ||
                                      molarityOption == '98.08' ||
                                      molarityOption == '63.01' ||
                                      molarityOption == '60.05') {
                                    setState(() {
                                      ifAcid = true;
                                    });
                                  } else {
                                    setState(() {
                                      ifAcid = false;
                                      _mAcidSpecifedGravity.clear();
                                      _mPurity.clear();
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
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
                                'Required Volume (L)',
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
                              border: Border.all(
                                  color: activeTextForm[0] == true
                                      ? Colors.blueAccent
                                      : Colors.transparent,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, bottom: 6.h),
                              child: TextFormField(
                                controller: _mRequiredVol,
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
                                onTap: () {
                                  setState(() {
                                    activeBorderCondition = 'act1';
                                    activeTextForm[0] = true;
                                    activeTextForm[1] = false;
                                    activeTextForm[2] = false;
                                    activeTextForm[3] = false;
                                    activeTextForm[4] = false;
                                    activeTextForm[5] = false;
                                    activeTextForm[6] = false;
                                    activeTextForm[7] = false;
                                  });
                                },
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
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
                                'Required Molarity (M)',
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
                              border: Border.all(
                                  color: activeTextForm[1] == true
                                      ? Colors.blueAccent
                                      : Colors.transparent,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                              child: TextFormField(
                                controller: _mRequiredMolarity,
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
                                onTap: () {
                                  setState(() {
                                    activeTextForm[0] = false;
                                    activeTextForm[1] = true;
                                    activeTextForm[2] = false;
                                    activeTextForm[3] = false;
                                    activeTextForm[4] = false;
                                    activeTextForm[5] = false;
                                    activeTextForm[6] = false;
                                    activeTextForm[7] = false;
                                  });
                                },
                              ),
                            ))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 3.h),
                      child: Container(
                        height: 20.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: ifAcid == false
                                ? Colors.grey.shade100
                                : const Color.fromARGB(146, 64, 123, 226),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            'For acids:',
                            style: TextStyle(
                                fontFamily: 'Inter ',
                                fontSize: 13.sp,
                                color: ifAcid == false
                                    ? Colors.grey.shade400
                                    : Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 70.w),
                          child: Container(
                            height: 19.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                                color: ifAcid == false
                                    ? Colors.grey.shade100
                                    : Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                'Specific gravity',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    color: ifAcid == false
                                        ? Colors.grey.shade400
                                        : Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: 20.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              color: ifAcid == false
                                  ? Colors.grey.shade100
                                  : const Color.fromARGB(146, 64, 123, 226),
                              border: Border.all(
                                  color: activeTextForm[2] == true
                                      ? Colors.blueAccent
                                      : Colors.transparent,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                              child: TextFormField(
                                controller: _mAcidSpecifedGravity,
                                enabled: ifAcid == false ? false : true,
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
                                onTap: () {
                                  if (ifAcid == false) {
                                    return;
                                  } else {
                                    setState(() {
                                      activeTextForm[0] = false;
                                      activeTextForm[1] = false;
                                      activeTextForm[2] = true;
                                      activeTextForm[3] = false;
                                      activeTextForm[4] = false;
                                      activeTextForm[5] = false;
                                      activeTextForm[6] = false;
                                      activeTextForm[7] = false;
                                    });
                                  }
                                },
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 70.w),
                          child: Container(
                            height: 19.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                                color: ifAcid == false
                                    ? Colors.grey.shade100
                                    : Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                '% Purity',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    color: ifAcid == false
                                        ? Colors.grey.shade400
                                        : Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: 20.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              color: ifAcid == false
                                  ? Colors.grey.shade100
                                  : const Color.fromARGB(146, 64, 123, 226),
                              border: Border.all(
                                  color: activeTextForm[3] == true
                                      ? Colors.blueAccent
                                      : Colors.transparent,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                              child: TextFormField(
                                controller: _mPurity,
                                enabled: ifAcid == false ? false : true,
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
                                onTap: () {
                                  setState(() {
                                    activeTextForm[0] = false;
                                    activeTextForm[1] = false;
                                    activeTextForm[2] = false;
                                    activeTextForm[3] = true;
                                    activeTextForm[4] = false;
                                    activeTextForm[5] = false;
                                    activeTextForm[6] = false;
                                    activeTextForm[7] = false;
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
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          'Add',
                          style:
                              TextStyle(fontFamily: 'Inter', fontSize: 11.sp),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 20.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(146, 64, 123, 226),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            massofSolute.toStringAsFixed(2),
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 4, 37, 92)),
                          )),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'of the compound to',
                          style:
                              TextStyle(fontFamily: 'Inter', fontSize: 11.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 20.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(146, 64, 123, 226),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              _mRequiredVol.text == ''
                                  ? '0.0'
                                  : _mRequiredVol.text,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 4, 37, 92)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'L of',
                          style:
                              TextStyle(fontFamily: 'Inter', fontSize: 11.sp),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 225.w, top: 2.h),
                      child: Text(
                        'distilled water',
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
                          EdgeInsets.only(left: 0.w, top: 5.h, bottom: 5.h),
                      child: SizedBox(
                        height: 50.h,
                        width: 320.w,
                        child: AdWidget(
                          ad: _banner!,
                        ),
                      ),
                    ),
              Container(
                height: 260.h,
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
                              'Normality (N):',
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
                              _nRequiredNorm.clear();
                              _nRequiredVol.clear();
                              _nPurity.clear();
                              _nSpecificGravity.clear();

                              setState(() {
                                nMassofSolute = 0.0;
                              });
                            } else if (conIconSwap2 == false) {
                              if (ifAcid2 == false) {
                                normalityCalculateMassOfSolute(
                                    double.parse(_nRequiredNorm.text),
                                    double.parse(_nRequiredVol.text),
                                    valencyValue,
                                    double.parse(normalityOption));
                              } else if (ifAcid2 == true) {
                                normalityCalculateVolumeOfAcidNeeded(
                                    double.parse(_nRequiredNorm.text),
                                    double.parse(_nRequiredVol.text),
                                    double.parse(normalityOption),
                                    double.parse(_nSpecificGravity.text),
                                    double.parse(_nPurity.text));
                              }
                            }
                            setState(() {
                              conIconSwap2 = !conIconSwap2;
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
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 70.w),
                          child: Container(
                            height: 26.h,
                            width: 175.w,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 8.w,
                              ),
                              child: DropdownButtonFormField(
                                dropdownColor: Colors.white,
                                iconEnabledColor: Colors.white,
                                iconDisabledColor: Colors.white,
                                menuMaxHeight: 200.h,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: -14.h),
                                    border: InputBorder.none),
                                hint: Text(
                                  'Select Compound',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 9.sp,
                                      color: Colors.white),
                                ),
                                selectedItemBuilder: (BuildContext context) {
                                  return [
                                    '',
                                    '36.46',
                                    '98.08',
                                    '63.01',
                                    '60.05',
                                    '',
                                    '40.00',
                                    '56.11',
                                    '35.05',
                                    '',
                                    '158.03',
                                    '169.87',
                                  ].map((String value) {
                                    return Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        _getDropdownMenuItemText2(value),
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp,
                                          color: Colors
                                              .white, // White color for selected item
                                        ),
                                      ),
                                    );
                                  }).toList();
                                },
                                items: [
                                  DropdownMenuItem(
                                    enabled: false,
                                    child: Container(
                                      height: 20.h,
                                      width: 140.w,
                                      color: Colors.blueAccent.shade100,
                                      child: Center(
                                        child: Text(
                                          'Acids',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 9.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '36.46',
                                    child: Text(
                                      'Hydrochloric acid (HCl)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '98.08',
                                    child: Text(
                                      'Sulfuric acid (H₂SO₄)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '63.01',
                                    child: Text(
                                      'Nitric acid (HNO₃)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '60.05',
                                    child: Text(
                                      'Acetic acid (CH₃COOH)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    enabled: false,
                                    child: Container(
                                      height: 20.h,
                                      width: 140.w,
                                      color: Colors.blueAccent.shade100,
                                      child: Center(
                                        child: Text(
                                          'Base',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 9.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '40.00',
                                    child: Text(
                                      'Sodium hydroxide (NaOH)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '56.11',
                                    child: Text(
                                      'Potassium hydroxide (KOH)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '35.05',
                                    child: Text(
                                      'Ammonium hydroxide(NH₄OH)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    enabled: false,
                                    child: Container(
                                      height: 20.h,
                                      width: 140.w,
                                      color: Colors.blueAccent.shade100,
                                      child: Center(
                                        child: Text(
                                          'Titration Reagents',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 9.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '158.03',
                                    child: Text(
                                      'permanganate(KMnO₄)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '169.87',
                                    child: Text(
                                      'Silver nitrate (AgNO₃)',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp),
                                    ),
                                  ),
                                ],
                                value: normalityOption.isEmpty
                                    ? null
                                    : normalityOption,
                                onTap: () {
                                  setState(() {
                                    activeBorderCondition = 'act2';
                                    activeTextForm[0] = false;
                                    activeTextForm[1] = false;
                                    activeTextForm[2] = false;
                                    activeTextForm[3] = false;
                                    activeTextForm[4] = false;
                                    activeTextForm[5] = false;
                                    activeTextForm[6] = false;
                                    activeTextForm[7] = false;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    normalityOption = value!;
                                    if (normalityOption == '36.46' ||
                                        normalityOption == '63.01' ||
                                        normalityOption == '60.05' ||
                                        normalityOption == '40.00' ||
                                        normalityOption == '56.11' ||
                                        normalityOption == '35.05' ||
                                        normalityOption == '158.03' ||
                                        normalityOption == '169.87') {
                                      valencyValue = 1;
                                    } else if (normalityOption == '98.08') {
                                      valencyValue = 2;
                                    }
                                    if (ifAcid2 == true) {
                                      //if its acid dont toggle the button

                                      if (normalityOption == '36.46' ||
                                          normalityOption == '98.08' ||
                                          normalityOption == '63.01' ||
                                          normalityOption == '60.05') {
                                        debugPrint('its still acid');
                                      } else {
                                        if (_nRequiredNorm.text == '' &&
                                            _nRequiredVol.text == '' &&
                                            _nSpecificGravity.text == '' &&
                                            _nPurity.text == '') {
                                          return;
                                        } else {
                                          conIconSwap2 = !conIconSwap2;
                                        }
                                      }
                                    } else if (ifAcid2 == false) {
                                      //if its non acid dont toggle the button
                                      if (normalityOption == '40.00' ||
                                          normalityOption == '56.11' ||
                                          normalityOption == '35.05' ||
                                          normalityOption == '158.03' ||
                                          normalityOption == '169.87') {
                                        debugPrint('its still a non acid');
                                      } else {
                                        if (_nRequiredNorm.text == '' &&
                                            _nRequiredVol.text == '' &&
                                            _nSpecificGravity.text == '' &&
                                            _nPurity.text == '') {
                                          return;
                                        } else {
                                          conIconSwap2 = !conIconSwap2;
                                        }
                                      }
                                    }
                                    activeBorderCondition = 'act2';
                                    activeTextForm[0] = false;
                                    activeTextForm[1] = false;
                                    activeTextForm[2] = false;
                                    activeTextForm[3] = false;
                                    activeTextForm[4] = false;
                                    activeTextForm[5] = false;
                                    activeTextForm[6] = false;
                                    activeTextForm[7] = false;
                                  });
                                  if (normalityOption == '36.46' ||
                                      normalityOption == '98.08' ||
                                      normalityOption == '63.01' ||
                                      normalityOption == '60.05') {
                                    setState(() {
                                      ifAcid2 = true;
                                    });
                                  } else {
                                    setState(() {
                                      ifAcid2 = false;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
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
                                'Required Volume (L)',
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
                                border: Border.all(
                                    color: activeTextForm[4] == true
                                        ? Colors.blueAccent
                                        : Colors.transparent,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                              child: TextFormField(
                                cursorColor: Colors.transparent,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 4, 37, 92)),
                                controller: _nRequiredVol,
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
                                    activeTextForm[5] = false;
                                    activeTextForm[6] = false;
                                    activeTextForm[7] = false;
                                  });
                                },
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
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
                                'Required Normality(N)',
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
                                    color: activeTextForm[5] == true
                                        ? Colors.blueAccent
                                        : Colors.transparent,
                                    width: 2.0)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                              child: TextFormField(
                                controller: _nRequiredNorm,
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
                                onTap: () {
                                  setState(() {
                                    activeBorderCondition = 'act2';
                                    activeTextForm[0] = false;
                                    activeTextForm[1] = false;
                                    activeTextForm[2] = false;
                                    activeTextForm[3] = false;
                                    activeTextForm[4] = false;
                                    activeTextForm[5] = true;
                                    activeTextForm[6] = false;
                                    activeTextForm[7] = false;
                                  });
                                },
                              ),
                            ))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 3.h),
                      child: Container(
                        height: 20.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: ifAcid2 == false
                                ? Colors.grey.shade100
                                : const Color.fromARGB(146, 64, 123, 226),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            'For acids:',
                            style: TextStyle(
                                fontFamily: 'Inter ',
                                fontSize: 13.sp,
                                color: ifAcid2 == false
                                    ? Colors.grey.shade400
                                    : Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 70.w),
                          child: Container(
                            height: 19.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                                color: ifAcid2 == false
                                    ? Colors.grey.shade100
                                    : Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                'Specific gravity',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    color: ifAcid2 == false
                                        ? Colors.grey.shade400
                                        : Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: 20.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                                color: ifAcid2 == false
                                    ? Colors.grey.shade100
                                    : const Color.fromARGB(146, 64, 123, 226),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: activeTextForm[6] == true
                                        ? Colors.blueAccent
                                        : Colors.transparent,
                                    width: 2.0)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                              child: TextFormField(
                                controller: _nSpecificGravity,
                                enabled: ifAcid2 == false ? false : true,
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
                                onTap: () {
                                  if (ifAcid2 == false) {
                                    return;
                                  } else {
                                    setState(() {
                                      activeBorderCondition = 'act2';
                                      activeTextForm[0] = false;
                                      activeTextForm[1] = false;
                                      activeTextForm[2] = false;
                                      activeTextForm[3] = false;
                                      activeTextForm[4] = false;
                                      activeTextForm[5] = false;
                                      activeTextForm[6] = true;
                                      activeTextForm[7] = false;
                                    });
                                  }
                                },
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 70.w),
                          child: Container(
                            height: 19.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                                color: ifAcid2 == false
                                    ? Colors.grey.shade100
                                    : Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                '% Purity',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    color: ifAcid2 == false
                                        ? Colors.grey.shade400
                                        : Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: 20.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                                color: ifAcid2 == false
                                    ? Colors.grey.shade100
                                    : const Color.fromARGB(146, 64, 123, 226),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: activeTextForm[7] == true
                                        ? Colors.blueAccent
                                        : Colors.transparent,
                                    width: 2.0)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                              child: TextFormField(
                                controller: _nPurity,
                                enabled: ifAcid2 == false ? false : true,
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
                                onTap: () {
                                  setState(() {
                                    activeBorderCondition = 'act2';
                                    activeTextForm[0] = false;
                                    activeTextForm[1] = false;
                                    activeTextForm[2] = false;
                                    activeTextForm[3] = false;
                                    activeTextForm[4] = false;
                                    activeTextForm[5] = false;
                                    activeTextForm[6] = false;
                                    activeTextForm[7] = true;
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
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          'Add',
                          style:
                              TextStyle(fontFamily: 'Inter', fontSize: 11.sp),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 20.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(146, 64, 123, 226),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            nMassofSolute.toStringAsFixed(2),
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 4, 37, 92)),
                          )),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'of the compound to',
                          style:
                              TextStyle(fontFamily: 'Inter', fontSize: 11.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 20.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(146, 64, 123, 226),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              _nRequiredVol.text == ''
                                  ? '0.0'
                                  : _nRequiredVol.text,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 4, 37, 92)),
                            ),
                          ), //TODO:
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'L of',
                          style:
                              TextStyle(fontFamily: 'Inter', fontSize: 11.sp),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 225.w, top: 2.h),
                      child: Text(
                        'distilled water',
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
