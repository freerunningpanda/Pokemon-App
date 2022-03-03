import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pokemon/models/home.dart';
import 'package:pokemon/models/other.dart';
import 'package:pokemon/models/pokemon_info.dart';
import 'package:pokemon/models/sprites.dart';
import 'package:sqflite/sqflite.dart';

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
  }

  Future<void> insertAbilities(PokemonInfo pokemonInfo) async {
    Database db = await instance.database;

    await db.insert(
      'abilities',
      {
        'pokemonId': pokemonInfo.id,
        'ability': pokemonInfo.getAbilities(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // READ
  Future<List<PokemonInfo>> pokemons() async {
    Database db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.rawQuery(
        'SELECT * FROM pokemons LEFT JOIN abilities ON pokemons.id = abilities.pokemonId');

    return List.generate(
      maps.length,
      (index) => PokemonInfo(
        id: maps[index]['id'],
        name: maps[index]['name'],
        sprites: Sprites(
            other: Other(home: Home(frontDefault: maps[index]['sprites']))),
        height: maps[index]['height'],
        weight: maps[index]['weight'],
        abilities: [Ability(ability: Species(name: maps[index]['ability']))],
        baseExperience: maps[index]['base_experience'],
      ),
    );
  }
}
