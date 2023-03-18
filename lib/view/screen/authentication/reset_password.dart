import 'package:flutter/material.dart';
import 'package:momma/view/screen/authentication/sign_in.dart';

import '../Verify.dart';
import '../../../firebase/firebase_auth.dart';
import '../../../modle/users.dart';

class ResetPassword extends StatefulWidget {
  static const routeName = '/resetPassword';
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late TextEditingController _email;
  late var formKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email = TextEditingController();
    formKey = GlobalKey<FormState>();

  }
  @override
  Widget build(BuildContext context) {
    final mqh= MediaQuery.of(context).size.height;
    final mqw= MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // title: Text('Sign up'),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData.fallback(),
        ),
        body: SafeArea(
            child: Padding(
          padding:  EdgeInsets.only(left: mqw * 0.06, top: mqh * 0.04, right: mqw * 0.06),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: mqh * 0.05,
                      margin:  EdgeInsetsDirectional.only(
                        top: mqh * 0.08,
                      ),
                      child: const Text(
                        "Reset Password",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Besley-Bold",
                          letterSpacing: 2,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                     SizedBox(
                      height: mqh * 0.01,
                    ),
                     Container(
                       height: mqh * 0.03,
                       child: Text(
                        "Enter your Email to Reset Password",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontFamily: "Besley-Regular",
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                    ),
                     ),
                     SizedBox(
                      height: mqh * 0.05,
                    ),
            Container(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _email,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    fontFamily: "Besley-Medium",
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    print("_password${_email.text}");
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email must not be null';
                    } else {
                      return null;
                    }
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 23,
                      fontFamily: "Besley-Regular",
                      color: Colors.black.withOpacity(.4),
                    ),
                  ),
                ),

            ),
                    SizedBox(
                      height: mqh * 0.05,
                    ),
                    SizedBox(
                      height:mqh * 0.08 ,
                      width: mqw,
                      child: RaisedButton(
                        padding: const EdgeInsetsDirectional.all(18),

                        onPressed: () {
                          resetPassword();
                        },

                        color: const Color.fromRGBO(106, 144, 242, 1),
                        textColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child:  const Text(
                          "Reset",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: "Tajawal",
                            color: Colors.white,
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )));
  }

  void resetPassword(){

    if(formKey.currentState!.validate()){
      FirebaseAuthController.firebaseAuthHelper
          .resetPassword(Users(email: _email.text));
      Navigator.pushNamed(context, SignIn.routName);

    }
  }
}
