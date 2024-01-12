import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/components/colors.dart';
import 'package:pet/pages/splash_screen.dart';

final dataStorage = GetStorage();
class petApp extends StatefulWidget {
  const petApp({Key? key}) : super(key: key);

  @override
  _petAppState createState() => _petAppState();
}

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "navigator");

class _petAppState extends State<petApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          title: 'Erixie',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            backgroundColor: primaryWhite,
            scaffoldBackgroundColor: primaryWhite,
            fontFamily: 'SofiaPro',
            hintColor: regularGrey,
            iconTheme: const IconThemeData(
              color: regularGrey,
              size: 24,
            ),
            appBarTheme: const AppBarTheme(
              elevation: 1,
              backgroundColor: primaryWhite,
              // foregroundColor: titleBlack,
              centerTitle: true,
            ),
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
