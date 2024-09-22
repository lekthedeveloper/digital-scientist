import 'package:digital_scientist/presentation/widget/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ViewDocScreen extends StatefulWidget {
  final String? data;
  const ViewDocScreen({super.key, required this.data});

  @override
  State<ViewDocScreen> createState() => _ViewDocScreenState();
}

class _ViewDocScreenState extends State<ViewDocScreen> {
  // ignore: non_constant_identifier_names
  String TTS_INPUT = """
Flutter is an open-source UI software  development \n toolkit created by Google.
""";

  final FlutterTts _flutterTts = FlutterTts();
  Map? _currentVoice;
  List<Map> _voices = [];
  int? _currentWordStart, _currentWordEnd;
  bool toggleAction = false;
  bool isSpeaking = false;
  @override
  void initState() {
    _flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
      });
    });
    _flutterTts.setErrorHandler((msg) {
      setState(() {
        isSpeaking = false;
      });
    });
    initTTS();
    super.initState();
  }

  void initTTS() {
    _flutterTts.setProgressHandler((text, start, end, word) {
      setState(() {
        _currentWordStart = start;
        _currentWordEnd = end;
      });
    });
    _flutterTts.getVoices.then((data) {
      try {
        _voices = List<Map>.from(data);

        debugPrint(_voices.toString());
        setState(() {
          // ignore: no_leading_underscores_for_local_identifiers
          _voices.where((_voice) => _voice["name"].contains("en")).toList();
          _currentVoice == _voices.first;
          setVoice(_currentVoice!);
        });
      } catch (error) {
        debugPrint(error.toString());
      }
    });
  }

  void setVoice(Map voice) {
    _flutterTts.setVoice(
      {'name': voice['name'], 'locale': voice['locale']},
    );
  }

  Future _speak() async {
    setState(() {
      isSpeaking = true;
    });

    await _flutterTts.speak(TTS_INPUT);
  }

  Future _stop() async {
    await _flutterTts.pause();
    setState(() {
      isSpeaking = false;
    });
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(_voices.toString());
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _flutterTts.speak(TTS_INPUT);
      //     debugPrint(_currentVoice.toString());
      //   },
      //   child: const Icon(Icons.speaker_phone),
      // ),
      // body: _buildUI(),
      body: Column(
        children: [
          const HeaderWidget(headerType: 'Type-2'),
          SizedBox(
            height: 20.h,
          ),
          //  _buildUI(),
          SizedBox(
            height: 580.h,
            width: 500.w,
            child: Stack(
              children: [
                Positioned(
                  top: 2.h,
                  left: 15.w,
                  child: SingleChildScrollView(
                    child: RichText(
                      maxLines: 10,

                      // textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13.sp,
                            color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: TTS_INPUT.substring(0, _currentWordStart),
                          ),
                          if (_currentWordStart != null)
                            TextSpan(
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15.sp,
                                  backgroundColor: Colors.greenAccent),
                              text: TTS_INPUT.substring(
                                _currentWordStart!,
                                _currentWordEnd,
                              ),
                            ),
                          if (_currentWordEnd != null)
                            TextSpan(
                              text: TTS_INPUT.substring(
                                _currentWordEnd!,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 500.h,
                    left: 30.w,
                    child: Container(
                      height: 55.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 80.w, right: 10.w),
                            child: SizedBox(
                              height: 20.h,
                              width: 30.w,
                              child: Transform(
                                  transform: Matrix4.rotationY(3.14),
                                  child: Image.asset(
                                    'assets/icons/forward.png',
                                  )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              setState(() {
                                toggleAction = !toggleAction;
                                if (!isSpeaking) {
                                  _speak();
                                } else if (isSpeaking) {
                                  _stop();
                                }
                              });
                            },
                            child: Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xfff2eee3)),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Center(
                                    child: Image.asset(isSpeaking
                                        ? 'assets/icons/pause.png'
                                        : 'assets/icons/play.png')),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 50.w),
                            child: SizedBox(
                              height: 20.h,
                              width: 30.w,
                              child: Image.asset('assets/icons/forward.png'),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUI() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _speakerSelector(),
      ],
    );
  }

  Widget _speakerSelector() {
    return DropdownButton(
      value: _currentVoice,
      items: _voices
          .map(
            // ignore: no_leading_underscores_for_local_identifiers
            (_voice) => DropdownMenuItem(
              value: _voice,
              child: Text(_voice['name']),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          _currentVoice = value;
          setVoice(_currentVoice!);
          debugPrint(' new voice: $_currentVoice');
        });
      },
    );
  }
}
