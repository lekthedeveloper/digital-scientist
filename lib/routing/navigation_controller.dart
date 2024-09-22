// ignore_for_file: unused_local_variable

import 'package:digital_scientist/presentation/screens/conversion_calc_screen.dart';
import 'package:digital_scientist/presentation/screens/conversion_calc_screen2.dart';
import 'package:digital_scientist/presentation/screens/dilution_screen.dart';
import 'package:digital_scientist/presentation/screens/home_screen.dart';
import 'package:digital_scientist/presentation/screens/molarity_screen.dart';

import 'package:digital_scientist/presentation/screens/notification_screen.dart';
import 'package:digital_scientist/presentation/screens/percent_solution_screen.dart';
import 'package:digital_scientist/presentation/screens/quiz_level.dart';
import 'package:digital_scientist/presentation/screens/quiz_questions.dart';
import 'package:digital_scientist/presentation/screens/reading_screen.dart';
import 'package:digital_scientist/presentation/screens/score_screen.dart';
import 'package:digital_scientist/presentation/screens/spot_test_questions_screen.dart';
import 'package:digital_scientist/presentation/screens/topic_screen.dart';
import 'package:digital_scientist/presentation/screens/writeup_screen.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String dashboard = '/';
  static const String topicScreen = '/topicScreen';
  static const String notificationScreen = '/notification';
  static const String writeupScreen = '/writeup';
  static const String readingScreen = '/viewDocument';
  static const String conversionScreen = '/conversionScreen';
  static const String conversionScreen2 = '/conversionScreen2';
  static const String dilutionScreen = '/dilution';
  static const String percentSolutionScreen = 'percentSolution';
  static const String molarityScreen = '/molarityScreen';
  static const String normalityScreen = '/normalityScreen';
  static const String quizLevelScreen = '/QuizQuestionScreen';
  static const String quizQuestionScreen = '/quizQuestions';
  static const String resultScreen = '/resultScreeb';
  static const String videoadsScreen = '/videoads';
  static const String spotQuestionScreen = '/spotquestionScreen';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    dynamic valuePassed;
    if (settings.arguments != null) {
      valuePassed = settings.arguments as Map<String, dynamic>;
    }
    switch (settings.name) {
      case dashboard:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case topicScreen:
        return MaterialPageRoute(
            builder: (context) => TopicScreen(
                  title: valuePassed['title'],
                ));
      case notificationScreen:
        return MaterialPageRoute(
            builder: (context) => const NotificationScreen());
      case writeupScreen:
        return MaterialPageRoute(
            builder: (context) => WriteupScreen(
                  data: valuePassed['data'],
                ));
      case readingScreen:
        return MaterialPageRoute(
            builder: (context) => ViewDocScreen(
                  data: valuePassed['data'],
                ));
      case conversionScreen:
        return MaterialPageRoute(
            builder: (context) => const ConversionCalculatorScreen());
      case conversionScreen2:
        return MaterialPageRoute(
            builder: (context) => const ConversionCalculatorScreen2());
      case dilutionScreen:
        return MaterialPageRoute(builder: (context) => const DilutionScreen());
      case percentSolutionScreen:
        return MaterialPageRoute(
            builder: (context) => const PercentSolutionScreen());
      case molarityScreen:
        return MaterialPageRoute(builder: (context) => const MolarityScreen());

      case spotQuestionScreen:
        return MaterialPageRoute(
            builder: (context) => SpotTestQuestions(
                  title: valuePassed['title'],
                ));
      case quizLevelScreen:
        return MaterialPageRoute(
            builder: (context) => QuizQuestionScreen(
                  quizType: valuePassed['quizType'],
                  quizTitle: valuePassed['quizTitle'],
                ));
      case quizQuestionScreen:
        return MaterialPageRoute(
            builder: (context) => QuizQuestions(
                  questions: valuePassed['questionLevel'],
                  title: valuePassed['title'],
                ));
      case resultScreen:
        return MaterialPageRoute(
            builder: (context) => ResultScreen(
                  score: valuePassed['score'],
                ));

      default:
        throw const FormatException('you have not added this route yet');
    }
  }
}
