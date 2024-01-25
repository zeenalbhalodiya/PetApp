import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class forgot_password extends StatefulWidget {
  const forgot_password({Key? key});

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {

  final _emailController =TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try{
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text('Check Your Email Id and Reset Your Password'),
        );
      },
      );
    } on FirebaseAuthException catch(e){
      print(e);
        showDialog(context: context, builder: (context){
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Enter your Email to Reset your Password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),

          SizedBox(height: 40),

          //email

          Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: 'Email',
              fillColor: Colors.grey[200],
                filled: true,
            ),
          ),
          ),
          SizedBox(height: 10),
          MaterialButton(
            onPressed: passwordReset,
            child: Text('Reset Password'),
            color: Colors.green,
          ),
        ],
      )
    );
  }
}