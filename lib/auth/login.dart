import 'package:appui/auth/signup.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../components/custombuttonauth.dart';
import '../components/customlogoauth.dart';
import '../components/textformfield.dart';
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
      TextEditingController passowrd = TextEditingController();
      GlobalKey<FormState> formState = GlobalKey<FormState>();

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if(googleUser==null){
      return;
    }


    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
     await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushNamedAndRemoveUntil("homepage", (route) => false);
  }

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


                 const Costomahmedlogo(),
                Container(height: 30,),
                const Text("login" ,style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold), ),
                Container(height: 15,),
                const Text("Please Login ", style: TextStyle(color:Colors.cyan),),
                Container(height: 30,),
                const Text("Emai",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold ),),
                Castomahmed  (hinttext: "ُEnter Your Email", mycontroller: email, validator: (val){
                  if(val == ""){
                    return "cant to be Empty";
                  }
                }),
                Container(height: 10,),
                const Text('password' , style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Castomahmed  (hinttext: "ُEnter Your password", mycontroller: passowrd,  validator: (val) {
                  if (val == "") {
                    return "cant to be Empty";
                  }
                }),


                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  alignment: Alignment.topRight,
                  child: const Text('Forgot password?' ,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal,),),
                ),


        ],
              ),
            ),
            costombottonahmed(
              title: 'login',
              onPressed: ()  async {
                if(formState.currentState!.validate())
                try {
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text,
                    password: passowrd.text,
                  );
                   if(credential.user!.emailVerified) {
                    Navigator.of(context).pushReplacementNamed("homepage");
                   }else{
                     FirebaseAuth.instance.authStateChanges().listen((User? user) {
                       if (user == null) {
                         print('User is currently signed out!');
                       } else {
                         print('User is signed in!');
                       }
                     });

                     AwesomeDialog(
                       context: context,
                       dialogType: DialogType.ERROR, // نوع الرسالة (خطأ)
                       animType: AnimType.SCALE, // نوع الانتقال للرسالة (مثل التوسيع)
                       title: ' Error',
                       desc: 'الرجاء التوجه الى البريد',
                       btnOkOnPress: () {
                         // هنا يمكنك تحديد ما يحدث عند الضغط على زر موافق
                         // على سبيل المثال، يمكنك إجراء إعادة تحميل الصفحة أو أي عملية أخرى.
                       },
                     ).show();
                   }
                }
                on FirebaseAuthException catch (e) {
                  if (e.code == 'user not found') {
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

                  } else if (e.code == 'email-already-in-use') {
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
                    ).show();
                  }
                } catch (e) {
                  print(e);
                }else{
                  print("not valid");
                }
              },),
            Container(height: 40,),

            Container(height: 11 ,),
            const Text("or login" , textAlign: TextAlign.center ),
            Container(height: 10,),
            MaterialButton(

              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
              ),
              color: Colors.deepOrangeAccent,
              onPressed: (){
                signInWithGoogle();
              } ,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                const Text(
                  "Login with Google",),
                Image.asset("assets/image/4 (1).png",
                  width: 25,
                height: 20,),
              ],),),
            // Text("Dont Have an Account Register?", textAlign: TextAlign.center,),
            Container(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,

                  MaterialPageRoute(builder: (context) => const signup()),
                );
              },

              child: const Text
                 ('تسجيل حساب جديد'),
            ),



        ],

      )
      )
      );

  }
}






