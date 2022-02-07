import 'package:flutter/material.dart';
import 'package:pokemon/pages/pokemon_page.dart';
import 'package:pokemon/pages/pokemon_search_page.dart';
import 'package:pokemon/services/pokemon_api_provider.dart';

import '../widgets/appbar.dart';
import '../widgets/background_widget.dart';
import '../models/pokemon_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late final PokemonInfo pokemonInfo;
  late Future<PokemonInfo> pokemonObject;
  String? _pokemonName;

  @override
  void initState() {
    super.initState();

    // if (pokemonInfo != null) {
    //   pokemonObject = Future.value(pokemonInfo);
    // }
  }

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
                    // if (tappedName != null) {
                    //   _pokemonName = tappedName;
                    //   pokemonObject = PokemonApiProvider()
                    //       .getPokemonInfo(name: _pokemonName);
                    // }
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
              // SizedBox(
              //   width: 270.0,
              //   height: 70.0,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       // Navigator.of(context).pushNamed('/main_page/pokemon_page');
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const HomePage()));
              //     },
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Icon(
              //           Icons.loop,
              //           color: Colors.red[900],
              //         ),
              //         const SizedBox(width: 5),
              //         Text(
              //           'Random Pokemon',
              //           style: TextStyle(
              //             fontSize: 25.0,
              //             color: Colors.red[900],
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ],
              //     ),
              //     style: ButtonStyle(
              //       shape: MaterialStateProperty.all(
              //         RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(15.0),
              //         ),
              //       ),
              //       backgroundColor: MaterialStateProperty.all(
              //         Colors.yellow[700],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
