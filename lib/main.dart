import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/pokemon_search_page.dart';
import 'pages/pokemon_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/main_page': (context) => const HomePage(),
        '/main_page/search_page': (context) => const PokemonSearchPage(),
        '/main_page/pokemon_page': (context) => PokemonPage(),
      },
      initialRoute: '/main_page',
    );
  }
}
