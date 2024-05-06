import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer (Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, 'home');},);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // title: Text("Festivals",style: TextStyle(color: whi),),
        // centerTitle: true,
      ),
      body: Center(
        child: Image.asset("assets/images/splash.jpeg"),
      ),
    );
  }
}
