import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet/components/app_text_style.dart';
import 'package:pet/components/colors.dart';
import 'package:pet/components/static_decoration.dart';

class AuthTitleWidget extends StatelessWidget {
  final String title;
  const AuthTitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: AppTextStyle.normalBold50.copyWith(
          height: 1.4,
          color: primaryBlack,
          fontSize: 42,
          fontWeight: FontWeight.w700),
    );
  }
}

// ignore: must_be_immutable
class AuthDontHaveAccountWidget extends StatelessWidget {
  Function()? onTap;
  String? title;
  String? buttonText;
  AuthDontHaveAccountWidget({Key? key, this.onTap, this.title, this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: title,
            style: TextStyle(
              fontSize: 12.w,
              fontWeight: FontWeight.w400,
              color: grey,
            ),
            children: [
              TextSpan(
                  text: ' ' + buttonText.toString(),
                  style:
                      AppTextStyle.normalSemiBold12.copyWith(color: appColor),
                  recognizer: TapGestureRecognizer()..onTap = onTap)
            ]),
      ),
    );
  }
}

class OrWidget extends StatelessWidget {
  const OrWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: borderColor,
              thickness: 1.0,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          text(
            text: "Or",
            color: grey,
            size: 14,
            fontWeight: FontWeight.w500,
          ),
          customWidth(20),
          Expanded(
            child: Divider(
              color: borderColor,
              thickness: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}

text({
  required String text,
  required Color color,
  required double size,
  FontWeight? fontWeight,
}) =>
    Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: size,
      ),
    );

Text textFieldTitleWidget(String title) {
  return Text(
    title,
    style: AppTextStyle.normalRegular14.copyWith(color: hintGrey),
  );
}

appButton(String text, {Function()? onTap}) => InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: Get.width,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: appColor,
          ),
        ),
      ),
    );
