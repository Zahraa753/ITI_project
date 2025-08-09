import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/sign_up.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (c) => SignUpPage()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F4EC),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Makes the shadow circular for round icons
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(2, 3), // X and Y shift of the shadow
              ),
            ],
          ),
          child: Icon(
            Icons.ac_unit_rounded,
            size: 50,
            color: Color(0xFFFEC500),
          ),
        ),
      ),
    );
  }
}
