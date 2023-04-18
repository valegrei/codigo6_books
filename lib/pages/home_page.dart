import 'dart:math';

import 'package:codigo6_books/widgets/item_home_widget.dart';
import 'package:codigo6_books/widgets/item_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double pyth = sqrt(pow(height, 2) + pow(width, 2));

    return Scaffold(
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.add,
              color: Colors.white,
            ),
            Text(
              "Agregar",
              style: GoogleFonts.manrope(
                fontSize: 18.0,
                color: Colors.white,
              ),
            )
          ],
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
                      "https://images.pexels.com/photos/14454202/pexels-photo-14454202.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
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
                          style: GoogleFonts.manrope(
                            fontSize: 14.0,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Buscar libro...",
                            hintStyle: GoogleFonts.manrope(
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
                          children: [
                            Text(
                              "Guarda\ntus libros\nfavoritos",
                              style: GoogleFonts.manrope(
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
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      "Mis libros favoritos",
                      style: GoogleFonts.manrope(
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
                        children: [
                          ItemSliderWidget(),
                          ItemSliderWidget(),
                          ItemSliderWidget(),
                          ItemSliderWidget(),
                          ItemSliderWidget(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Lista General",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.manrope(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ItemHomeWidget(),
                    ItemHomeWidget(),
                    ItemHomeWidget(),
                    ItemHomeWidget(),
                    ItemHomeWidget(),
                    ItemHomeWidget(),
                    const SizedBox(
                      height: 40.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
