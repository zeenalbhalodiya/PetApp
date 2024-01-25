import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet/components/app_asset.dart';
import 'package:pet/components/buttons/text_button.dart';
import 'package:pet/components/ui.dart';
import 'package:pet/controller/authController.dart';
import 'package:pet/pages/create_account_screen.dart';
import 'package:pet/widget/auth_title_widget.dart';
import 'package:pet/widget/text_widgets/input_text_field_widget.dart';
import '../components/colors.dart';
import '../components/common_methos.dart';
import '../components/static_decoration.dart';
import '../widget/shadow_container_widget.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(AuthController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  @override
  void initState() {
    super.initState();
    // dataStorage.write("isOnBoarded", true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: UiInterface.commonAppBar(leadingWidget: const SizedBox()),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  height15,
                  const AuthTitleWidget(
                    title: "Login to your Account",
                  ),
                  customHeight(40),
                  EmailWidget(
                    controller: controller.emailController,
                    hintText: "Email",
                  ),
                  height16,
                  PasswordWidget(
                    controller: controller.passwordController,
                    // validator: CommonMethod().passwordValidator,
                    hintText: "Password",
                  ),
                  customHeight(40),
                  // appButton("Forgot password?", onTap: () {
                  //   Get.to(() => const ForgetPasswordScreen());
                  // }),
                  customHeight(30),
                  PrimaryTextButton(
                    onPressed: () {
                      if (controller.emailController.text.isEmpty) {
                        CommonMethod()
                            .getXSnackBar('Error', 'Please enter email', red);
                      } else if (!emailRegex
                          .hasMatch(controller.emailController.text)) {
                        CommonMethod().getXSnackBar(
                            'Error', 'Please enter valid email', red);
                      } else if (controller.passwordController.text.isEmpty) {
                        CommonMethod().getXSnackBar(
                            'Error', 'Please enter password', red);
                      } else {
                        controller.signInWithEmailAndPassword(context);
                      }
                    },
                    title: "Log in",
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return forgot_password();
                            },),);
                  },
                          child: Text(
                              'Forgot Password ?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  customHeight(25),
                  const OrWidget(),
                  customHeight(25),

                  ShadowContainerWidget(
                      padding: 0,
                      widget: SizedBox(
                        height: 50,
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppAsset.icGoogle),
                            width10,
                            Text('Sign In with Google')
                          ],
                        ),
                      )),
                  // customHeight(25),
                  // ImageButton(
                  //   onPressed: () {
                  //     controller.loginWithGoogle(context);
                  //   },
                  //   buttonName: 'Login With Google',
                  //   imageLink: AppAsset.icGoogle,
                  // ),
                  customHeight(30),
                  AuthDontHaveAccountWidget(
                    buttonText: "Sign up",
                    title: "Don't have an account?",
                    onTap: () {
                      Get.to(() => const CreateAccountScreen());
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}