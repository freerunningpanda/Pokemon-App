// import 'dart:io';

// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// import '../models/pokemon_info.dart';

// class DatabaseHelper {
//   static const _dbName = 'myDatabase.db';
//   static const _dbVersion = 1;
//   static const _tableName = 'myTable';

//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDB();
//     return _database!;
//   }

//   _initDB() async {
//     Directory directory = await getApplicationSupportDirectory();
//     String path = join(directory.path, _dbName);
//     return await openDatabase(path, version: _dbVersion, onCreate: _createDB);
//   }

//   Future _createDB(Database db, int version) async {
//     const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
//     const textType = 'TEXT NOT NULL';
//     const boolType = 'BOOLEAN NOT NULL';
//     const integerType = 'INTEGER NOT NULL';

//     await db.execute(
//         'CREATE TABLE $_tableName (${PokemonInfoFields.name} $textType)');
//   }

//   // Future<PokemonInfo> create(PokemonInfo pokemonInfo) async {
//   //   final db = await instance.database;

//   //   final id = await db.insert(_tableName, pokemonInfo.toJson());
//   //   return pokemonInfo.copy(id: id);
//   // }

//   Future<PokemonInfo> readPokemon(int id) async {
//     final db = await instance.database;

//     final maps = await db.query(
//       _tableName,
//       columns: PokemonInfoFields.values,
//       where: '${PokemonInfoFields.id} = ?',
//       whereArgs: [id],
//     );

//     if (maps.isNotEmpty) {
//       return PokemonInfo.fromJson(maps.first);
//     } else {
//       throw Exception('ID $id not found');
//     }
//   }

//   Future<int> insert(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     return await db.insert(_tableName, row);
//   }

//   Future<List<Map<String, dynamic>>> queryAll() async {
//     final db = await instance.database;
//     return await db.query(_tableName);
//   }

//   // Future<int> update(Map<String, dynamic> row) async {
//   //   Database db = await instance.database;
//   //   int id = row[PokemonInfoFields.id];
//   //   return await db.update(_tableName, row,
//   //       where: '${PokemonInfoFields.id} == ?', whereArgs: [id]);
//   // }

//   Future<int> update(PokemonInfo pokemonInfo) async {
//     final db = await instance.database;

//     return db.update(
//       _tableName,
//       pokemonInfo.toJson(),
//       where: '${PokemonInfoFields.id} = ?',
//       whereArgs: [pokemonInfo.id],
//     );
//   }

//   Future<int> delete(int id) async {
//     final db = await instance.database;

//     return await db.delete(
//       _tableName,
//       where: '${PokemonInfoFields.id} = ?',
//       whereArgs: [id],
//     );
//   }

//   // Future<int> delete(int id) async {
//   //   Database db = await instance.database;
//   //   return await db.delete(_tableName,
//   //       where: '${PokemonInfoFields.id} = ?', whereArgs: [id]);
//   // }

//   Future close() async {
//     final db = await instance.database;

//     db.close();
//   }
// }
