import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double pyth = sqrt(pow(height, 2) + pow(width, 2));

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Row(
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
                const SizedBox(
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
    );
  }
}
