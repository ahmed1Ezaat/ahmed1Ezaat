import 'package:flutter/material.dart';
class Costomahmedlogo extends StatelessWidget {
  const Costomahmedlogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 70,
          height: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(50)
          ),
          child: Image.asset("assets/image/logo.png", width: 50, height: 70,  )),
    );
  }
}
