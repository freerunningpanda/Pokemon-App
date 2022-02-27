import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../db/pokemon_database.dart';
import 'background_widget.dart';
import '../cubit/pokemon_cubit.dart';
import 'custom_progress_indicator.dart';
import 'image_provider_widget.dart';

class PokemonPageWidget extends StatelessWidget {
  const PokemonPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokemonCubit, PokemonState>(
      listener: (context, state) {
        if (state is PokemonErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is PokemonLoadedState) {
          return _buildPokemonPage(context, state);
        }
        return const CustomProgressIndicator();
      },
    );
  }
}

Widget _buildPokemonPage(BuildContext context, PokemonLoadedState state) {
  final item = state.loadPokemon;
  return Container(
    width: double.infinity,
    decoration: backGroundWidget(),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(209, 139, 0, 0.5),
            border: Border.all(),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              'Name:',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.red[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            ImageProviderWidget(imageUrl: item.getSprites()),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height:',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  '${item.height / 10} cm',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Weight:',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  '${item.weight / 10} kg',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Abilities:',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  item.getAbilities(),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Base experience:',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  '${item.baseExperience}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 270.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed('/main_page/search_page'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 5),
                    Text(
                      'Back',
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
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 270.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () async {
                  await PokemonDatabase.instance.insertPokemon(item);
                  print(await PokemonDatabase.instance.pokemons());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 5),
                    Text(
                      'Save',
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
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    ),
  );
}
