import 'package:pokemon/models/pokemon_info.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PokemonDatabase {
  PokemonDatabase._privateConstructor();
  static final PokemonDatabase instance = PokemonDatabase._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  _initDB() async {
    return await openDatabase(
      join(
        await getDatabasesPath(),
        'pokemon_database.db',
      ),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pokemons(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, frontDefault TEXT NOT NULL, height REAL NOT NULL, weight REAL NOT NULL, abilities TEXT NOT NULL, baseExperience INTEGER NOT NULL)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertPokemon(PokemonInfo pokemonInfo) async {
    final db = await instance.database;

    await db.insert(
      'pokemons',
      pokemonInfo.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
