import 'package:flutter/material.dart';

PreferredSizeWidget? appBar() {
  return AppBar(
    iconTheme: IconThemeData(
      color: Colors.yellow[700],
    ),
    backgroundColor: Colors.red[900],
    centerTitle: true,
    title: Image.asset(
      'assets/appbar_logo/pokeapi.png',
      height: 45,
    ),
  );
}
