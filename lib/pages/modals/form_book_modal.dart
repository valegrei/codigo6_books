import 'package:codigo6_books/db/db_admin.dart';
import 'package:codigo6_books/models/book_model.dart';
import 'package:flutter/material.dart';

import '../../widgets/common_textfield_widget.dart';

class FormBookModal extends StatefulWidget {
  @override
  State<FormBookModal> createState() => _FormBookModalState();
}

class _FormBookModalState extends State<FormBookModal> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _authorController = TextEditingController();

  final TextEditingController _imageController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final _myFormKey = GlobalKey<FormState>();

  void registerBook() {
    if (_myFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.greenAccent,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          content: Row(
            children: const [
              Icon(
                Icons.check,
                color: Colors.white,
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: Text(
                "El libro se registró correctamente",
              )),
            ],
          )));
      BookModel myBook = BookModel(
        title: _titleController.text,
        author: _authorController.text,
        description: _descriptionController.text,
        image: _imageController.text,
      );
      DBAdmin().insertBook(myBook).then((value) {
        if (value > 0) {
          //Se agrego el libro correctamente
          Navigator.pop(context);
        } else {}
      }).catchError((error) {
        print(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36.0),
          topRight: Radius.circular(36.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _myFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Agregar Libro",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              CommonTextFieldWidget(
                hintText: "Ingresa un título",
                icon: Icons.book,
                label: "Título",
                controller: _titleController,
              ),
              CommonTextFieldWidget(
                hintText: "Ingresa un autor",
                icon: Icons.person,
                label: "Autor",
                controller: _authorController,
              ),
              CommonTextFieldWidget(
                hintText: "Ingresa el url de la portada",
                icon: Icons.image,
                label: "Portada",
                controller: _imageController,
              ),
              CommonTextFieldWidget(
                hintText: "Ingresa una descripción",
                icon: Icons.view_headline,
                label: "Descripción",
                maxLines: 4,
                controller: _descriptionController,
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                    onPressed: () {
                      //Guardar los datos del libro
                      registerBook();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff22223b),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                    child: const Text(
                      "Agregar",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
