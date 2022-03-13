import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/home.dart';
import '../models/other.dart';
import '../models/pokemon_info.dart';
import '../models/sprites.dart';
import '../models/ability.dart';
import '../models/species.dart';

class PokemonDatabase {
  PokemonDatabase._privateConstructor();
  static final PokemonDatabase instance = PokemonDatabase._privateConstructor();

  static late Database _database;

  Future<Database> get database async {
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'pokemon_database.db';
    return await openDatabase(
      path,
      onCreate: _createDB,
      version: 1,
    );
  }

  void _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE pokemons(id INTEGER PRIMARY KEY, name TEXT NOT NULL, sprites TEXT NOT NULL, height REAL NOT NULL, weight REAL NOT NULL, base_experience INTEGER NOT NULL)',
    );
    await db.execute(
      'CREATE TABLE abilities(id INTEGER PRIMARY KEY AUTOINCREMENT, pokemonId INTEGER NOT NULL, ability TEXT NOT NULL, FOREIGN KEY (pokemonId) REFERENCES pokemons (id))',
    );
  }

  Future<void> insertPokemon(PokemonInfo pokemonInfo) async {
    Database db = await instance.database;

    pokemonInfo.id = await db.insert(
      'pokemons',
      {
        'id': pokemonInfo.id,
        'name': pokemonInfo.name,
        'sprites': pokemonInfo.getSprites(),
        'height': pokemonInfo.height,
        'weight': pokemonInfo.weight,
        'base_experience': pokemonInfo.baseExperience,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await db.insert(
      'abilities',
      {
        'pokemonId': pokemonInfo.id,
        'ability': pokemonInfo.getAbilities(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<PokemonInfo?> getPokemon(String? name) async {
    Database db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.rawQuery(
        'SELECT * FROM pokemons LEFT JOIN abilities ON pokemons.id = abilities.pokemonId where pokemons.name = ?',
        [name]);

    if (maps.isEmpty) {
      return null;
    }

    var pokemon = PokemonInfo(
      id: maps[0]['id'],
      name: maps[0]['name'],
      sprites:
          Sprites(other: Other(home: Home(frontDefault: maps[0]['sprites']))),
      height: maps[0]['height'],
      weight: maps[0]['weight'],
      abilities: [Ability(ability: Species(name: maps[0]['ability']))],
      baseExperience: maps[0]['base_experience'],
    );

    return pokemon;
  }
}
