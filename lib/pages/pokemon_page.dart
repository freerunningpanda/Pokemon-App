import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pokemon_cubit.dart';
import '../widgets/appbar.dart';
import '../services/pokemon_repository.dart';
import '../widgets/pokemon_page_widget.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final pokemonRepository = PokemonRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonCubit>(
      create: (context) => PokemonCubit(pokemonRepository),
      child: Scaffold(
        appBar: appBar(),
        body: const PokemonPageWidget(),
      ),
    );
  }
}
