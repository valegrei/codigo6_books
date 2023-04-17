import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? myDatabase;

  Future<Database?> checkDatabase() async {
    if (myDatabase == null) {
      myDatabase = await initDatabase();
    }
    return myDatabase;
  }

  //Crear la base de datos
  Future<Database> initDatabase() async {
    print("Iniciando la Base de Datos");
    Directory directory = await getApplicationDocumentsDirectory();
    //print(directory);
    String pathDatabase = join(directory.path, "DBBooks.db");
    //print(pathDatabase);
    Future<Database> db = openDatabase(pathDatabase, version: 1,
        onCreate: (Database db, int version) {
      db.execute(
          "CREATE TABLE BOOK(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, author TEXT, description TEXT, image TEXT)");
    });
    print("Fin!!");
    return db;
  }

  //Consultas

  //Inserciones
  insertBook() async {
    Database? db = await checkDatabase();
    db!.rawInsert(
        "INSERT INTO BOOK(title, author, description, image) VALUES ('Agua', 'José Marpia Arguedas', 'Lorem ipsum...', 'https/www.google.com')");
  }

//Actualizaciones
}
