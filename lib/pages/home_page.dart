

import 'package:codigo6_books/db/db_admin.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              // DBAdmin admin = DBAdmin();
              // admin.insertBook();
              //DBAdmin().insertBookRaw();
              DBAdmin().getBooks();
            }, child: Text(
              "Select",
            )),
            ElevatedButton(onPressed: (){
              // DBAdmin admin = DBAdmin();
              // admin.insertBook();
              //DBAdmin().insertBookRaw();
              DBAdmin().insertBook();
            }, child: Text(
              "Insert",
            )),
          ],
        ),
      ),
    );
  }
}