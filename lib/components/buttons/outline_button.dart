// ignore_for_file: must_be_immutable, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet/components/app_text_style.dart';
import 'package:pet/components/colors.dart';
import 'package:pet/components/static_decoration.dart';

class OutlineBorderButton extends StatelessWidget {
  String? title;
  VoidCallback onPressed;
  VoidCallback? onLongPress;
  double? height;
  double? width;
  double? borderwidth;
  double? radius;
  double? fontSize;

  Color? textColor;
  Color? borderColor;
  Color? backgroundColor;
  ButtonTextTheme? textTheme;
  BorderRadiusGeometry? borderRadius;

  OutlineBorderButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.height,
    this.width,
    this.fontSize,
    this.radius,
    this.textColor,
    this.borderColor,
    this.onLongPress,
    this.textTheme,
    this.backgroundColor,
    this.borderwidth,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 55,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? circular30BorderRadius,
          ),
          backgroundColor: backgroundColor ?? appColor.withOpacity(0.3),
          side: BorderSide(
              color: borderColor ?? primaryWhite, width: borderwidth ?? 1),
        ),
        onPressed: onPressed,
        child: Text(
          title.toString(),
          style: AppTextStyle.normalBold18.copyWith(
              color: textColor ?? primaryWhite, fontSize: fontSize ?? 16),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class OutlineIconButton extends StatelessWidget {
  String? title;
  VoidCallback onPressed;
  Color? color;
  Icon icon;

  OutlineIconButton({
    Key? key,
    this.color,
    required this.title,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )),
      ),
      label: Text(title.toString()),
      icon: icon,
      onPressed: onPressed,
    );
  }
}

class OutlineRowIconButton extends StatelessWidget {
  String? title;
  VoidCallback onPressed;
  Color? color;
  String? icon;
  OutlineRowIconButton({
    Key? key,
    this.color,
    required this.title,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: appColor))),
      ),
      label: Text(
        title.toString(),
        style: AppTextStyle.normalSemiBold14.copyWith(color: grey),
      ),
      icon: SvgPicture.asset(
        icon!,
        height: 30,
        width: 30,
      ),
      onPressed: onPressed,
    );
  }
}
