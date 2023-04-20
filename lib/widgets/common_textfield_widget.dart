import 'package:flutter/material.dart';

class CommonTextFieldWidget extends StatelessWidget {
  String hintText;
  IconData icon;
  String label;
  int? maxLines;

  CommonTextFieldWidget({
    required this.hintText,
    required this.icon,
    required this.label,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label:"),
          const SizedBox(
            height: 5.0,
          ),
          TextField(
            maxLines: maxLines ?? 1,
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
            ),
          ),
        ],
      ),
    );
  }
}
