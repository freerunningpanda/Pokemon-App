import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/services/pokemon_repository.dart';
import 'package:pokemon/widgets/pokemon_search_page_widget.dart';

import '../widgets/appbar.dart';
import '../cubit/pokemon_cubit.dart';

class PokemonSearchPage extends StatelessWidget {
  const PokemonSearchPage({Key? key}) : super(key: key);

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
