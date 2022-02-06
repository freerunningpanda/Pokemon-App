import 'package:flutter/material.dart';

BoxDecoration splashScreenBackGroundWidget() {
  return const BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/splash_screen_bg/splash_screen_bg.jpg'),
        fit: BoxFit.cover),
  );
}

BoxDecoration backGroundWidget() {
  return const BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/background_image/background.jpg'),
        fit: BoxFit.cover),
  );
}
