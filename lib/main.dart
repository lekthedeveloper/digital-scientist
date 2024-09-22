import 'package:digital_scientist/business_logic/dropdown_provider/dropdown_provider.dart';
import 'package:digital_scientist/business_logic/navigation/bottom_navigation_provider.dart';
import 'package:digital_scientist/presentation/screens/page_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import 'routing/navigation_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BottomNavProvider()),
          ChangeNotifierProvider(create: (context) => DropDownProvider())
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Dashboard(),
          initialRoute: RouteManager.dashboard,
          onGenerateRoute: RouteManager.generateRoute,
        ),
      ),
    );
  }
}
