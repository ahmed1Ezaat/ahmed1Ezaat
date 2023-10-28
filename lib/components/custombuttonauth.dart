import 'package:flutter/material.dart';

class costombottonahmed extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const costombottonahmed({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
      ),
      color: Colors.orange,
      onPressed: onPressed ,
      child: Text(title),
      

);
  }
}
