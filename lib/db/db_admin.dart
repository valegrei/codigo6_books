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

  Future<List<BookModel>> getBooks() async {
    Database? db = await _checkDatabase();
    List<Map<String, dynamic>> data = await db!.query(
        "Book",
        orderBy: "id DESC",
    );
    List<BookModel> books = data.map((e) => BookModel.fromJson(e)).toList();
    return books;
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

  Future<int> updateBook(BookModel book) async {
    Database? db = await _checkDatabase();
    return db!.update("Book", book.toJson(), where: "id = ${book.id}");
  }

  //Eliminar
  deleteBookRaw() async {
    Database? db = await _checkDatabase();
    int value = await db!.rawDelete("DELETE FROM Book WHERE id = 7");
    print(value);
  }

  Future<int> deleteBook(int id) async {
    Database? db = await _checkDatabase();
    return db!.delete("Book", where: "id = $id");
  }
}
