import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemSliderWidget extends StatelessWidget{
  const ItemSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double pyth = sqrt(pow(height, 2) + pow(width, 2));

    return Container(
      width: pyth * 0.25,
      margin: EdgeInsets.only(right: 16.0, top: pyth*0.038),
      child: Column(
        children: [
          Container(
            width: pyth * 0.25,
            height: pyth * 0.19,
            decoration: BoxDecoration(
              color: const Color(0xffB2DFDC),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: pyth * 0.035,
                  child: Container(
                    height: pyth * 0.19,
                    width: pyth * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.35),
                          blurRadius: 12,
                          offset: const Offset(4, 4),
                        ),
                      ],
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images1.penguinrandomhouse.com/cover/9780593500484",
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  "The Lord of the Rings: Chapter 2",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  "JRR Tolkien",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.65),
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}