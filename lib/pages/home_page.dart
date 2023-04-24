import 'dart:math';

import 'package:codigo6_books/db/db_admin.dart';
import 'package:codigo6_books/models/book_model.dart';
import 'package:codigo6_books/pages/modals/form_book_modal.dart';
import 'package:codigo6_books/widgets/item_home_widget.dart';
import 'package:codigo6_books/widgets/item_slider_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BookModel? bookTemp;
  bool isRegister = true;

  showFormBook() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: FormBookModal(
              isRegister: isRegister,
              book: bookTemp,
            ),
          );
        }).then((value) {
      setState(() {});
    });
  }

  showDeleteDialog(int id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Atención"),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Text("¿Desea eliminar este libro?"),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancelar",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            DBAdmin().deleteBook(id).then((value) {
                              if (value >= 0) {
                                Navigator.pop(context);
                                setState(() {});
                                //SnackBar
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff22223b),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              )),
                          child: const Text("Eliminar"),
                        ),
                      ),
                    ],
                  )
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double pyth = sqrt(pow(height, 2) + pow(width, 2));

    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          bookTemp = null;
          isRegister = true;
          showFormBook();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xff22223b),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Text(
                "Agregar",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: pyth * 0.42,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://images.freeimages.com/images/large-previews/18d/bookshelf-1617462.jpg",
                    ),
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Container(
                        width: pyth * 0.35,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                        ),
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 14.0,
                            offset: const Offset(4, 4),
                          ),
                        ]),
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Buscar libro...",
                            hintStyle: const TextStyle(
                              fontSize: 14.0,
                            ),
                            suffixIcon: const Icon(
                              Icons.search,
                              size: 19.0,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Row(
                          children: const [
                            Text(
                              "Guarda\ntus libros\nfavoritos",
                              style: TextStyle(
                                fontSize: 36.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FutureBuilder(
                  future: DBAdmin().getBooks(),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      List<BookModel> books = snap.data;
                      return books.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 2.0,
                                  ),
                                  const Text(
                                    "Mis libros favoritos",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16.0,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    child: Row(
                                      children: books
                                          .map((book) => ItemSliderWidget(
                                                book: book,
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  const Text(
                                    "Lista General",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  ListView.builder(
                                    itemCount: books.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ItemHomeWidget(
                                        book: books[index],
                                        onDelete: () {
                                          showDeleteDialog(books[index].id!);
                                        },
                                        onUpdate: () {
                                          bookTemp = books[index];
                                          isRegister = false;
                                          showFormBook();
                                        },
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 40.0,
                                  ),
                                ],
                              ),
                            )
                          : Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/box.png",
                                      height: pyth * 0.1,
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    const Text(
                                      "Por favor registra tu primer libro.",
                                    ),
                                  ],
                                ),
                              ),
                            );
                    }
                    return const CircularProgressIndicator();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
