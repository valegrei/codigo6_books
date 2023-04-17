import 'package:codigo6_books/db/db_admin.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  //DBAdmin().getBooksRaw();
                  DBAdmin().getBooks();
                },
                child: Text(
                  "Select",
                )),
            ElevatedButton(
                onPressed: () {
                  //DBAdmin().insertBookRaw();
                  DBAdmin().insertBook();
                },
                child: Text(
                  "Insert",
                )),
            ElevatedButton(
                onPressed: () {
                  // DBAdmin().updateBookRaw();
                  DBAdmin().updateBook();
                },
                child: Text(
                  "Update",
                )),
            ElevatedButton(
                onPressed: () {
                  // DBAdmin().deleteBookRaw();
                  DBAdmin().deleteBook();
                },
                child: Text(
                  "Delete",
                )),
          ],
        ),
      ),
    );
  }
}
