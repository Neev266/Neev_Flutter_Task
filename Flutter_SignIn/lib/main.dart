import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter_app/Pages/login.dart';
import 'Pages/signup.dart';
import 'Pages/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/home': (context) => Home(),
        '/signin': (context) => Signup(),
        
      }
    );
  }
}
