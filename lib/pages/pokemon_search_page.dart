import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/services/pokemon_repository.dart';
import 'package:pokemon/widgets/pokemon_search_page_widget.dart';

import '../widgets/custom_progress_indicator.dart';
import '../widgets/appbar.dart';
import '../widgets/background_widget.dart';
import '../cubit/pokemon_cubit.dart';

class PokemonSearchPage extends StatefulWidget {
  const PokemonSearchPage({Key? key}) : super(key: key);

  @override
  State<PokemonSearchPage> createState() => _PokemonSearchPageState();
}

class _PokemonSearchPageState extends State<PokemonSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: BlocProvider<PokemonCubit>(
        create: (context) => PokemonCubit(PokemonRepository()),
        child: const PokemonSearchPageWidget(),
      ),
    );
  }
}
