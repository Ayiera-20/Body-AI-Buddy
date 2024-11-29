import 'dart:async';
import 'package:body_ai_buddy/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              const Center(
            child: SpinKitCircle(
              color: Color(0xFF44544b), 
              size: 100.0, 
            )),
            const SizedBox(height: 30),
          const Text("Welcome to Body AI Buddy",
          style: TextStyle(fontSize: 32,
          fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30,),
          Container(
            width: 500,
            height: 500,
        alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/doc2.png"),
                  fit: BoxFit.cover,
                ),
          ),),
          const SizedBox(height: 30,),
          const Text('Health Made Simple, Personalized, and Accessible.',
          style: TextStyle( fontSize: 20,),
          textAlign: TextAlign.center,), 
            ]
              )
          ),
    );
  }
}


