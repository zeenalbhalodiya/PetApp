import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/components/colors.dart';

class CommonMethod {
  void showSnackBar(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future getXSnackBar(String title, String message, Color? color) async {
    Get.snackbar(
      title,
      message,
      backgroundColor: color,
      colorText: primaryWhite,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      duration: const Duration(seconds: 2),
      borderRadius: 10,
      barBlur: 10,
    );
  }

  void getXConfirmationSnackBar(
    String title,
    String message,
    Function() onButtonPress,
  ) {
    Get.snackbar(title, message,
        mainButton: TextButton(
          onPressed: onButtonPress,
          child: const Icon(Icons.delete, color: primaryWhite),
        ),
        backgroundColor: appColor,
        colorText: primaryWhite,
        isDismissible: true,
        // dismissDirection: SnackDismissDirection.HORIZONTAL,
        duration: const Duration(seconds: 6),
        borderRadius: 10,
        barBlur: 10,
        icon: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.close,
              color: primaryWhite,
            )));
  }

  /// Checks if string is an video file.
  static bool isVideo(String filePath) {
    var ext = filePath.toLowerCase();

    return ext.endsWith(".mp4") ||
        ext.endsWith(".avi") ||
        ext.endsWith(".wmv") ||
        ext.endsWith(".mov") ||
        ext.endsWith(".MOV") ||
        ext.endsWith(".rmvb") ||
        ext.endsWith(".mpg") ||
        ext.endsWith(".webm") ||
        ext.endsWith(".mpeg") ||
        ext.endsWith(".3gp");
  }
}



// mov
// webm
// mpg
// wmv