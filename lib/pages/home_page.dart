import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pokemon_random_cubit.dart';
import 'pokemon_search_page.dart';
import '../widgets/appbar.dart';
import '../widgets/background_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        decoration: backGroundWidget(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 270.0,
                height: 70.0,
                child: ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PokemonSearchPage(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.yellow[700],
                        size: 27,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Find Pokemon',
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
              const SizedBox(height: 20),
              BlocBuilder<PokemonRandomCubit, PokemonRandomState>(
                builder: (context, state) {
                  return SizedBox(
                    width: 270.0,
                    height: 70.0,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<PokemonRandomCubit>().fetchRandomPokemon();
                        Navigator.of(context)
                            .pushNamed('/main_page/random_pokemon_page');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.loop,
                            color: Colors.red[900],
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Random Pokemon',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.red[900],
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
                          Colors.yellow[700],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
