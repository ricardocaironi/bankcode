import 'package:appcompass/services/fire_auth_service.dart';
import 'package:flutter/material.dart';
import 'Pages/home_page.dart';
import 'Pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FireAuthService(context).getLoggerUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: user != null? HomePage(user) : LoginPage(),
    );
  }
}
