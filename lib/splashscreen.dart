import 'dart:async';
import 'package:acolyte/login.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  loadApp() {
    Future.delayed(const Duration(seconds: 3), () async {
     Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  bool isInternet = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFF3d4ee6),
        body: Stack(children: [
          Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/pesa.png',
                    //color: Colors.red[400],
                    width: 150,
                    height: 120,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const CircularProgressIndicator(
                    color: Colors.white,
                  )
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "from",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  const Text(
                    "Acolyte",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
