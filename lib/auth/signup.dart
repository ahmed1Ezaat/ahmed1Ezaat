import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/custombuttonauth.dart';
import '../components/customlogoauth.dart';
import '../components/textformfield.dart';
class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController usrnam = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                Form(
                  key: formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 50,),



                      Costomahmedlogo(),
                      Container(height: 30,),
                      const Text("SignUp" ,style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold), ),
                      Container(height: 15,),
                      const Text("Please SignUp  ", style: TextStyle(color:Colors.cyan),),
                      Container(height: 30,),
                      const Text("User Name",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold ),),
                      Castomahmed  (hinttext: "ُEnter Your User Name", mycontroller: usrnam,  validator: (val) {
                        if (val == "") {
                          return "cant to be Empty";
                        }
                      }),
                      Container(height: 10,),
                      const Text('Email' , style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      Castomahmed  (hinttext: "ُEnter Your email", mycontroller: email,  validator: (val) {
                        if (val == "") {
                          return "cant to be Empty";
                        }
                      }),
                      const Text("password",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold ),),
                      Castomahmed  (hinttext: "ُEnter Your password", mycontroller: password,  validator: (val) {
                        if (val == "") {
                          return "cant to be Empty";
                        }
                      }),



                     Container(height: 30,),

                    ],
                  ),
                ),
                costombottonahmed( title: 'SignUp', onPressed: () async
                {try {
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                  FirebaseAuth.instance.currentUser!.sendEmailVerification();
                  Navigator.of(context).pushReplacementNamed('/login');

                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.ERROR, // نوع الرسالة (خطأ)
                      animType: AnimType.SCALE, // نوع الانتقال للرسالة (مثل التوسيع)
                      title: 'Login Error',
                      desc: 'The password provided is too weak.',
                      btnOkOnPress: () {
                        // هنا يمكنك تحديد ما يحدث عند الضغط على زر موافق
                        // على سبيل المثال، يمكنك إجراء إعادة تحميل الصفحة أو أي عملية أخرى.
                      },
                    ).show(); // تظهر رسالة الخطأ

                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.ERROR, // نوع الرسالة (خطأ)
                      animType: AnimType.SCALE, // نوع الانتقال للرسالة (مثل التوسيع)
                      title: 'Login Error',
                      desc: 'The account already exists for that email.',
                      btnOkOnPress: () {
                        // هنا يمكنك تحديد ما يحدث عند الضغط على زر موافق
                        // على سبيل المثال، يمكنك إجراء إعادة تحميل الصفحة أو أي عملية أخرى.
                      },
                    ).show(); // تظهر رسالة الخطأ

                  }
                } catch (e) {
                  print(e);
                }},),
                Container(height: 20),

                Container(height: 40,),

                Container(height: 11 ,),
                const Text("or login" , textAlign: TextAlign.center ),
                Container(height: 10,),

                // Text("Dont Have an Account Register?", textAlign: TextAlign.center,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('العودة إلى صفحة تسجيل الدخول'),
                ),



              ],

            )
        )
    );

  }
}






