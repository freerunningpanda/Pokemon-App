import 'package:flutter/material.dart';

import 'background_widget.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: splashScreenBackGroundWidget(),
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.yellow[700],
          backgroundColor: Colors.red[900],
        ),
      ),
    );
  }
}
