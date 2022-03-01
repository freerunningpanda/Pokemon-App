import 'package:pokemon/models/home.dart';
import 'package:pokemon/models/other.dart';
import 'package:pokemon/models/pokemon_info.dart';
import 'package:pokemon/models/sprites.dart';
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
        db.execute(
          'CREATE TABLE pokemons(id INTEGER PRIMARY KEY, name TEXT NOT NULL, sprites TEXT NOT NULL, height REAL NOT NULL, weight REAL NOT NULL, base_experience INTEGER NOT NULL)',
        );
        db.execute(
          'CREATE TABLE abilities(id INTEGER PRIMARY KEY, pokemonId INTEGER NOT NULL, name TEXT NOT NULL, FOREIGN KEY (pokemonId), REFERENCES pokemons (id))',
        );
      },
      version: 1,
    );
  }

  Future<void> insertPokemon(PokemonInfo pokemonInfo) async {
    final db = await instance.database;

    await db.insert(
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
        'name': pokemonInfo.getAbilities(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<PokemonInfo>> pokemons() async {
    final db = await instance.database;

    // final List<Map<String, dynamic>> maps = await db.query('pokemons');
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        'SELECT pokemons.id, pokemons.name, pokemons.sprites, pokemons.height, pokemons.weight, pokemons.base_experience, abilities.name FROM pokemons LEFT JOIN abilities ON pokemons.id = abilities.pokemonId');

    return List.generate(
      maps.length,
      (index) => PokemonInfo(
        id: maps[index]['id'],
        name: maps[index]['name'],
        sprites: Sprites(
            other: Other(home: Home(frontDefault: maps[index]['sprites']))),
        height: maps[index]['height'],
        weight: maps[index]['weight'],
        abilities: maps[index]['abilities'],
        baseExperience: maps[index]['base_experience'],
      ),
    );
  }
}
