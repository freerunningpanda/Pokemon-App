import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/cubit/pokemon_random_cubit.dart';
import '/services/pokemon_repository.dart';
import 'pages/home_page.dart';
import 'pages/pokemon_random_page.dart';
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
    return BlocProvider<PokemonRandomCubit>(
      create: (context) => PokemonRandomCubit(PokemonRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/main_page': (context) => const HomePage(),
          '/main_page/random_pokemon_page': (context) =>
              const PokemonRandomPage(),
          '/main_page/search_page': (context) => const PokemonSearchPage(),
          '/search_page/pokemon_page': (context) => const PokemonPage(),
        },
        initialRoute: '/main_page',
      ),
    );
  }
}
