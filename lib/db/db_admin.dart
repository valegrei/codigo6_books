import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? _myDatabase;

  static final DBAdmin _instance = DBAdmin._mandarina();

  DBAdmin._mandarina();

  factory DBAdmin(){
    return _instance;
  }

  Future<Database?> _checkDatabase() async {
    if (_myDatabase == null) {
      _myDatabase = await _initDatabase();
    }
    return _myDatabase;
  }

  //Crear la base de datos
  Future<Database> _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String pathDatabase = join(directory.path, "DBBooks.db");
    return openDatabase(pathDatabase, version: 1,
        onCreate: (Database db, int version) {
      db.execute(
          "CREATE TABLE BOOK(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, author TEXT, description TEXT, image TEXT)");
    });
  }

  //Consultas
  getBooks() async {
    Database? db = await _checkDatabase();
    List data = await db!.rawQuery("SELECT * FROM Book");
    //print(data);
    data.forEach((element) {
      print(element);
    });
  }

  //Inserciones
  insertBookRaw() async {
    Database? db = await _checkDatabase();
    db!.rawInsert(
        "INSERT INTO BOOK(title, author, description, image) VALUES ('Agua', 'José Marpia Arguedas', 'Lorem ipsum...', 'https/www.google.com')");
  }

  insertBook() async {
    Database? db = await _checkDatabase();
    db!.insert("BOOK", {
      "title": "Yawar Fiesta",
      "author": "José María Arguedas",
      "description": "Loremmmmmm",
      "image": "https://www...",
    }
    );
  }

  //Actualizaciones
  updateBook() async {
    Database? db = await _checkDatabase();

  }
}
