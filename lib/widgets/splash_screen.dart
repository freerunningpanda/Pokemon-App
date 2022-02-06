import 'package:flutter/material.dart';

import 'background_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, '/main_page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: splashScreenBackGroundWidget(),
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.yellow[700],
            backgroundColor: Colors.red[900],
          ),
        ),
      ),
    );
  }
}
