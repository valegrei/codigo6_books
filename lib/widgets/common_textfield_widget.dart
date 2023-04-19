import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonTextFieldWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Titulo:"),
          const SizedBox(height: 5.0,),
          TextField(
            decoration: InputDecoration(
              hintText: "Titulo",
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.rocket),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14.0,
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