import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pokemon_cubit.dart';
import 'background_widget.dart';
import 'pokemon_page_widget.dart';

class PokemonSearchPageWidget extends StatefulWidget {
  const PokemonSearchPageWidget({Key? key}) : super(key: key);

  @override
  State<PokemonSearchPageWidget> createState() =>
      _PokemonSearchPageWidgetState();
}

class _PokemonSearchPageWidgetState extends State<PokemonSearchPageWidget> {
  String? pokemonName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backGroundWidget(),
        child: BlocBuilder<PokemonCubit, PokemonState>(
          builder: (context, state) {
            if (state is PokemonLoadedState) {
              return const PokemonPageWidget();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[a-z]")),
                    ],
                    cursorColor: Colors.red[900],
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      fillColor: Color.fromRGBO(209, 139, 0, 0.5),
                      filled: true,
                      hintText: 'Enter the name',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                    ),
                    onChanged: (value) => pokemonName = value,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 270.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<PokemonCubit>().fetchPokemon(pokemonName);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 5),
                          Text(
                            'Search',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.yellow[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          Colors.red[900],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
