import 'package:flutter/material.dart';
class Castomahmed extends StatelessWidget {
  final String hinttext;
  final TextEditingController mycontroller;
   final String? Function(String?)? validator;

  const Castomahmed({super.key, required this.hinttext, required this.mycontroller, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: mycontroller,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(fontSize: 14 , color: Colors.cyan),

        contentPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 10 ),
        filled: true,
        fillColor: Colors.blueGrey[100],
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25)
        ),
      ),
    );
  }
}
