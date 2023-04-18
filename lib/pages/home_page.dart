import 'dart:math';

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
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            "https://images1.penguinrandomhouse.com/cover/9780593500484",
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
                                "The Lord of the Rings",
                                style: GoogleFonts.manrope(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "JRR Tolkien",
                                style: GoogleFonts.manrope(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                style: GoogleFonts.manrope(
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
