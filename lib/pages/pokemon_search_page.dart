import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/appbar.dart';
import '../widgets/background_widget.dart';

class PokemonSearchPage extends StatefulWidget {
  const PokemonSearchPage({Key? key}) : super(key: key);

  @override
  State<PokemonSearchPage> createState() => _PokemonSearchPageState();
}

class _PokemonSearchPageState extends State<PokemonSearchPage> {
  late String pokemonName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        decoration: backGroundWidget(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
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
                  onPressed: () => Navigator.of(context)
                    ..pop(pokemonName)
                    ..pushNamed('/main_page/pokemon_page'),
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
        ),
      ),
    );
  }
}
