import 'package:logging_app/feature/data/constants/db_constants.dart';
import 'package:logging_app/feature/data/datasource/impl/log_datasource_impl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = DBConstants.dbName;
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    final database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
    return database;
  }

  Future<void> create(Database database, int version) async {
    //Create Tables
    await LogDataSourceImpl.createTable(database);
  }
}
