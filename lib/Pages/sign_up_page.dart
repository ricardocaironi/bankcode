import 'package:appcompass/Pages/home_page.dart';
import 'package:appcompass/model/userdata.dart';
import 'package:appcompass/services/fire_auth_service.dart';
import 'package:flutter/material.dart';
import '../custom/custom_background_pages.dart';
import '../custom/custom_colors.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    void _navigateToHomePage(UserData user) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(user),
        ),
      );
    }

    void _submit() async {
      final name = _nameController.text;
      final email = _emailController.text;
      final password = _passwordController.text;
      final confirm = _confirmController.text;

      setState(() => _isLoading = true);

      final user = await FireAuthService(context)
          .createUserWithEmailAndPassword(name, email, password, confirm);

      setState(() => _isLoading = false);

      if (user != null) {
        _navigateToHomePage(user);
      }
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 45, horizontal: 35),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradienteColorsSignUp(),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextLogo(),
                ImageLogo(),
                Padding(padding: EdgeInsets.all(10)),
                Column(
                  children: [
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            style: TextStyle(color: Colors.white),
                            autofocus: true,
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              labelText: "User name",
                              labelStyle: TextStyle(color: Colors.white70),
                              // ignore: prefer_const_constructors
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white70,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                            ),
                          ),
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
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
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
                          TextFormField(
                            controller: _confirmController,
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Confirm password",
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
                Padding(padding: EdgeInsets.all(16)),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)))),
                  onPressed: _submit,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Back to  ',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text('Login',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          textAlign: TextAlign.center),
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
