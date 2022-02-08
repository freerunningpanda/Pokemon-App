import 'package:flutter/material.dart';

import '../widgets/random_pokemon_page_widget.dart';
import '../widgets/appbar.dart';
import '../services/pokemon_repository.dart';

class PokemonRandomPage extends StatefulWidget {
  const PokemonRandomPage({Key? key}) : super(key: key);

  @override
  State<PokemonRandomPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonRandomPage> {
  final pokemonRepository = PokemonRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const RandomPokemonPageWidget(),
    );
  }
}
