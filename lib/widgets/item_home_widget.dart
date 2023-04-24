import 'dart:math';

import 'package:codigo6_books/models/book_model.dart';
import 'package:flutter/material.dart';

class ItemHomeWidget extends StatelessWidget {
  BookModel book;
  Function onDelete;
  Function onUpdate;

  ItemHomeWidget({
    required this.book,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double pyth = sqrt(pow(height, 2) + pow(width, 2));

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  book.image,
                  width: pyth * 0.12,
                  height: pyth * 0.16,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      book.author,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      book.description,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.65)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
            top: 16,
            right: 0,
            child: PopupMenuButton(
              onSelected: (int value){
                if(value==1){
                  onUpdate();
                }else{
                  onDelete();
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 1,
                    // onTap: (){
                    //   onUpdate();
                    // },
                    child: Row(
                      children: const [
                        Icon(Icons.edit),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text("Actualizar"),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    // onTap: () {
                    //   onDelete();
                    // },
                    child: Row(
                      children: const [
                        Icon(Icons.delete_outline_rounded),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text("Eliminar"),
                      ],
                    ),
                  ),
                ];
              },
            )),
      ],
    );
  }
}
