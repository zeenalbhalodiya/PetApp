import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/components/colors.dart';
import 'package:pet/controller/model/users_model.dart';
import 'package:pet/controller/repository/user_repository.dart';

class Userrepository extends GetxController {
  static Userrepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(userModel user) async {
    await _db.collection("users").add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your account has been created.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      ),
    )
        .catchError((error, stackTrace){
      Get.snackbar("Error", "Something went wrong, try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      print(error.toString());
    });
  }
}