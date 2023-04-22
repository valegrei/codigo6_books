import 'dart:io';

import 'package:codigo6_books/models/book_model.dart';
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
  getBooksRaw() async {
    Database? db = await _checkDatabase();
    List data = await db!.rawQuery("SELECT * FROM Book");
    //print(data);
    data.forEach((element) {
      print(element);
    });
  }

  getBooks() async {
    Database? db = await _checkDatabase();
    List data = await db!.query("Book", columns: ["id","title"], where: "id = 3");
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

  Future<int> insertBook(BookModel model) async {
    Database? db = await _checkDatabase();
    return db!.insert("BOOK", model.toJson());
  }

  //Actualizaciones
  updateBookRaw() async {
    Database? db = await _checkDatabase();
    int value = await db!.rawUpdate("UPDATE Book SET title = 'El zorro de arrbia y el zorro de abajo' WHERE id = 4");
    print(value);
  }

  updateBook() async {
    Database? db = await _checkDatabase();
    int value = await db!.update("Book", {
      "title": "1984",
    },
    where: "id = 3");
    print(value);
  }

  //Eliminar
  deleteBookRaw() async {
    Database? db = await _checkDatabase();
    int value = await db!.rawDelete("DELETE FROM Book WHERE id = 7");
    print(value);
  }

  deleteBook() async {
    Database? db = await _checkDatabase();
    int value = await db!.delete("Book", where: "id = 8");
    print(value);
  }
}
