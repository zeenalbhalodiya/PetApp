import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/app.dart';
import 'package:pet/components/app_asset.dart';
import 'package:pet/components/app_text_style.dart';
import 'package:pet/components/colors.dart';
import 'package:pet/components/static_decoration.dart';
import 'package:pet/utils/app_constants.dart';
import 'package:pet/utils/network_dio/network_dio.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

String uid = dataStorage.read('userid');

class _SplashScreenState extends State<SplashScreen> {
  static final dataStorage = GetStorage();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      startTime();
    });
  }

  startTime() async {
    return Timer(
      const Duration(milliseconds: 1500),
      () {
        Get.offAll(
          () => const LoginScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAsset.logo,
              height: 200,
            ),
            customHeight(50),
            Text(
              'Pet App',
              style: AppTextStyle.regularBold.copyWith(fontSize: 28),
            )
          ],
        ),
      ),
    );
  }
}
