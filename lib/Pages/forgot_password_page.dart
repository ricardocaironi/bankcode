import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(
          'Reset Password',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        gradient: LinearGradient(
            colors: [Color.fromARGB(255, 109, 187, 144), Colors.blueGrey]),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Text(
                'Receive an email to\n reset your password',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: 'Email'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                ),
                icon: Icon(Icons.email_outlined),
                label: Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
    Future resetPassword() async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: CircularProgressIndicator(),
        ),
      );
      try{
        await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      } on FirebaseAuthException catch (e){
        print(e);
      }
    }
  }
}
