import 'package:flutter/cupertino.dart';
import 'package:pet/components/colors.dart';

class ShadowContainerWidget extends StatelessWidget {
  final Widget widget;
  double? padding;
  double? radius;
  BorderRadiusGeometry? customRadius;
  double? blurRadius;
  Color? shadowColor;
  Color? borderColor;
  Color? color;

  ShadowContainerWidget(
      {Key? key,
      required this.widget,
      this.padding,
      this.radius,
      this.blurRadius,
      this.customRadius,
      this.borderColor,
      this.shadowColor,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(padding ?? 15.0),
        decoration: BoxDecoration(
          color: color ?? whiteColor,
          boxShadow: [
            BoxShadow(
              blurRadius: blurRadius ?? 10.0,
              color: shadowColor ?? lightGrey,
            ),
          ],
          borderRadius: customRadius ?? BorderRadius.circular(radius ?? 15.0),
          border: Border.all(
            color: borderColor ?? lightGrey,
          ),
        ),
        child: widget);
  }
}
