import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pet/components/global_singlton.dart';
import 'package:pet/controller/model/users_model.dart';
import 'package:pet/utils/repository/network_repository.dart';

import '../components/colors.dart';
import '../components/common_methos.dart';
import '../pages/home_screen.dart';
import '../pages/login_screen.dart';
import 'model/user_repository.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final userRepo = Get.put(UserRepository());

  Future clearForm() async {
    emailController.clear();
    passwordController.clear();
    passwordController.clear();
  }
  // Register with email and password
  Future<void> registerWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      if(userCredential.user != null) {
        User user = userCredential.user!;
        // Send email verification
        await userCredential.user!
            .sendEmailVerification()
            .whenComplete(() async =>

            saveUserDetails(userModel(id: user.uid.toString(),
                email:user.email.toString().trim(), password: passwordController.text,
                confirmpassword: confirmPasswordController.text)));

        await CommonMethod().getXSnackBar(
          "Success",
          'Verification email sent to ${userCredential.user!.email}',
          Colors.green,
        )
            .then((value) => Get.to(() => LoginScreen())
      );
    }
      // Send email verification
      await userCredential.user!
          .sendEmailVerification()
          .whenComplete(() async => await CommonMethod().getXSnackBar(
        "Success",
        'Verification email sent to ${userCredential.user!.email}',
        Colors.green,
      ))
          .then((value) => Get.to(() => LoginScreen()));
    } on FirebaseAuthException catch (e) {
      // Handle specific error cases
      if (e.code == 'email-already-in-use') {
        await CommonMethod().getXSnackBar(
          "Error",
          'The email address is already in use. Please use a different email.',
          Colors.red,
        );
      } else if (e.code == 'weak-password') {
        await CommonMethod().getXSnackBar(
          "Error",
          'The password provided is too weak. Please choose a stronger password.',
          Colors.red,
        );
      } else {
        // Handle other authentication errors
        await CommonMethod().getXSnackBar(
          "Error",
          'Failed to register: ${e.message}',
          Colors.red,
        );
      }
    }
  }
  Future saveUserDetails(userModel user) async {
    userRepo.createUser(user);
    // controller.registerWithEmailAndPassword(context);
    }
  // Sign in with email and password
  Future<String?> signInWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim().toString(),
          password: passwordController.text);

      if (userCredential.user!.emailVerified) {
        // User is signed in and email is verified
        await CommonMethod()
            .getXSnackBar("Success", 'Sign-in successfully', success)
            .whenComplete(() => Get.to(() => HomeScreen()));
      } else {
        // Email is not verified, handle accordingly
        await CommonMethod().getXSnackBar(
            "Error",
            'Email not verified. Check your inbox for the verification email.',
            red);
        print('');
      }
    } on FirebaseAuthException catch (e) {
      await CommonMethod()
          .getXSnackBar("Error", 'Failed to sign in: ${e.message}', red);
    }
  }
  Future<User?> handleSignInGoogle() async {
    try {
      await googleSignIn
          .signOut(); // Sign out to allow multiple account selection
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();

      if (googleSignInAccount == null) {
        // User canceled Google Sign-In
        await CommonMethod()
            .getXSnackBar("Info", 'Google Sign-In canceled by user', red);
        return null;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
      await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        // Successfully signed in with Google
        await CommonMethod()
            .getXSnackBar("Success", 'Signed in: ${user.displayName}', success)
            .whenComplete(() => Get.to(() => HomeScreen()));
      }

      return user;
    } catch (error) {
      // Handle specific error cases
      if (error is FirebaseAuthException) {
        await CommonMethod().getXSnackBar(
            "Error", 'Firebase Auth Error: ${error.message}', red);
      } else {
        // Handle other errors
        await CommonMethod()
            .getXSnackBar("Error", 'Error signing in with Google: $error', red);
      }
      return null;
    }
  }




  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      CommonMethod().getXSnackBar("Error", 'Error signing out: $e', red);
    }
  }

  void loginUser(BuildContext context, GlobalKey<FormState> formKey) {}
}
  loginUser(context, formKey) async {
    // if (formKey.currentState?.validate()) {
    //   final authUserData = {
    //     "email": emailController.text.trim(),
    //     "password": passwordController.text.trim(),
    //     "deviceToken": GlobalSingleton().deviceToken.toString()
    //   };
    //   final authResponse =
    //       await networkRepository.userLogin(context, authUserData);
    //   print("ag--- $authResponse");
    //   checkLoginData(authResponse, context);
    // }
  }

  loginWithGoogle(context) {
    // final GoogleSignIn _googleSignIn = GoogleSignIn(
    //   scopes: <String>[
    //     'email',
    //   ],
    // );
    // _googleSignIn.disconnect();
    // try {
    //   _googleSignIn.signIn().then((GoogleSignInAccount? acc) async {
    //     acc!.authentication.then((GoogleSignInAuthentication? auth) async {
    //       final authUserData = {
    //         "idToken": auth!.idToken.toString(),
    //         "accessToken": auth.accessToken.toString(),
    //         "deviceToken": GlobalSingleton().deviceToken
    //       };
    //       print('id token -' + auth.idToken.toString());
    //       print('access token -' + auth.accssToken.toString());

    //       print(authUserData);
    //       final authResponse =
    //           (await networkRepository.googleLogin(context, authUserData));

    //       checkLoginData(authResponse, context);
    //     });
    //   });
    // } catch (e) {
    //   print(e);
    // }
  }