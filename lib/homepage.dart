// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Install'),
          actions: [
            IconButton(
            onPressed: () async{
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();

              Navigator.of(context).pushNamed('/login');

            },

            icon: Icon(Icons.exit_to_app), // هنا يجب أن يكون IconData صحيحًا مثل Icons.exit_to_app
          )

          ],
        ),
        body: ListView(
          children: [
              // Text("How Are You", style: )
        FirebaseAuth.instance.currentUser!.emailVerified
        ? Text("Welcome")
            : Column(
    children: [
    MaterialButton(
    onPressed: () {
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
    },
    color: Colors.cyan,
    focusColor: Colors.orange,
    child: Text("Please validate your email"),
    ),


          ]
        ),

    ]
    )
    );
  }
}











