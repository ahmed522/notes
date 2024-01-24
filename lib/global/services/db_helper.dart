import 'dart:io';
import 'package:get/get.dart';
import 'package:notes/features/notes/model/note_model.dart';
import 'package:notes/global/constants/images_assets.dart';
import 'package:notes/global/constants/numbers.dart';
import 'package:notes/global/constants/strings.dart';
import 'package:notes/global/widgets/error_page.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _init();
    return _db!;
  }

  Future<String> get _dbPath async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String fullPath = join(documentsDirectory.path, AppStrings.databaseName);
    return fullPath;
  }

  Future<Database> _init() async {
    return openDatabase(
      await _dbPath,
      version: AppNumbers.databaseVersion,
      onCreate: _onCreate,
      singleInstance: true,
    );
  }

  // SQL code to create the database table

  _createTable(Database db) => db.execute('''
          CREATE TABLE IF NOT EXISTS ${AppStrings.notesTableName} (
            id INTEGER NOT NULL, 
            ${AppStrings.titleColumn} TEXT,
            ${AppStrings.contentColumn} TEXT,
            ${AppStrings.typeColumn} TEXT NOT NULL,
            ${AppStrings.creationTimeColumn} TEXT NOT NULL,
            ${AppStrings.lastUpdateTimeColumn} TEXT NOT NULL,
            ${AppStrings.colorColumn} INTEGER,
            ${AppStrings.fontColorColumn} INTEGER,
            ${AppStrings.attachmentColumn} TEXT,
            PRIMARYkEY("id")
           );
          ''');

  Future _onCreate(Database db, int version) async {
    await _createTable(db);
  }

  Future insert(NoteModel row) async {
    // Get a reference to the database.
    final Database db = await database;
    try {
      await db.insert(
        AppStrings.notesTableName,
        row.toJson,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      Get.to(
        () => const ErrorPage(
          imageAsset: AppImagesAssets.errorImageAsset,
          message: AppStrings.insertErrorText,
        ),
      );
    }
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await database;
    return await db.query(AppStrings.notesTableName);
  }

  Future<int> deleteRow(int id) async {
    return await _db!.delete(
      AppStrings.notesTableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
