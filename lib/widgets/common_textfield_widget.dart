import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextFieldWidget extends StatelessWidget {
  String hintText;
  IconData icon;
  String label;
  int? maxLines;
  TextEditingController controller;

  CommonTextFieldWidget({
    required this.hintText,
    required this.icon,
    required this.label,
    this.maxLines,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label:",
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w600,
          ),),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(4, 4),
                ),
              ]
            ),
            child: TextFormField(
              controller: controller,
              maxLines: maxLines ?? 1,
              style: GoogleFonts.manrope(),
              decoration: InputDecoration(
                hintText: hintText,
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(icon),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 12.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
                errorStyle: GoogleFonts.manrope(),
              ),
              validator: (String? value) {
                if(value != null && value.isEmpty){
                  return "Campo Obligatorio";
                }
                // if(value != null && value.length < 8){
                //   return "El campo debe de tener más de 8 carácteres";
                // }
              },
            ),
          ),
        ],
      ),
    );
  }
}
