import 'package:appcompass/Pages/home_page.dart';
import 'package:appcompass/Pages/sign_up_page.dart';
import 'package:appcompass/services/fire_auth_service.dart';
import 'package:flutter/material.dart';
import '../custom/custom_background_pages.dart';
import '../custom/custom_colors.dart';
import '../model/userdata.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _signInEmailAndPasswordLoading = false;

  @override
  Widget build(BuildContext context) {
    void _resetForm() {
      _emailController.clear();
      _passwordController.clear();
    }

    void _navigateToHomePage(UserData user) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(user),
        ),
      );
    }

    void _signInEmailAndPassword() async {
      final email = _emailController.text;
      final password = _passwordController.text;

      setState(() {
        _signInEmailAndPasswordLoading = true;
      });

      final user = await FireAuthService(context)
          .signInWithEmailAndPassword(email, password);

      setState(() {
        _signInEmailAndPasswordLoading = false;
      });

      if (user != null) {
        _resetForm();
        _navigateToHomePage(user);
      }
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 35),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradienteColorsLogin(),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextLogo(),
              ImageLogo(),
              Padding(
                padding: EdgeInsets.all(18),
              ),
              Column(
                children: [
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          style: TextStyle(color: Colors.white),
                          autofocus: true,
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            labelText: "E-mail",
                            labelStyle: TextStyle(color: Colors.white70),
                            // ignore: prefer_const_constructors
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              color: Colors.white70,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white70),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.white70),
                            // ignore: prefer_const_constructors
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.white70,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white70),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(6)),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ForgotPasswordPage(),
                  ),
                ),
                child: Text('Forgot password?',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.right),
              ),
              Padding(padding: EdgeInsets.all(20)),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                onPressed: _signInEmailAndPassword,
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(34),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create account?  ",
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    child: Text('Sign Up',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
