import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../components/app_text_style.dart';
import '../components/colors.dart';


class NoDataFound extends StatefulWidget {
  const NoDataFound({Key? key}) : super(key: key);

  @override
  State<NoDataFound> createState() => _NoDataFoundState();
}

class _NoDataFoundState extends State<NoDataFound> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        // height: Get.height / 1.2,
        child: Column(
          children: [
            Lottie.asset('assets/json/nodata.json'),
            Text(
              "No Data Found",
              style: AppTextStyle.normalBold18
                  .copyWith(color: grey.withOpacity(.4)),
            )
          ],
        ),
      ),
    );
  }
}
