import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:momma/modle/product.dart';
import 'package:momma/view/screen/authentication/reset_password.dart';
import 'package:momma/view/screen/authentication/sign_up.dart';
import 'package:momma/view/widget/tapBar.dart';

import '../../../firebase/firebase_auth.dart';
import '../../../modle/users.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
  static const routName = "/signIn ";
}

class _SignInState extends State<SignIn> {
  late TextEditingController _email;
  late TextEditingController _password;
  late var formKey;
  late bool isPassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    formKey = GlobalKey<FormState>();
    isPassword = true;
  }

  @override
  Widget build(BuildContext context) {
    final mqh = MediaQuery.of(context).size.height;
    final mqw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: mqw * 0.025, top: mqh * 0.03, right: mqw * 0.025),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(
                        top: mqh * 0.1, start: mqw * 0.02),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontFamily: "Besley-Bold",
                        letterSpacing: 2,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: mqh * 0.01, left: mqw * 0.02),
                    child: const Text(
                      "Login to start using app,",
                      style: TextStyle(
                        color: Colors.grey,
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
                    color: Colors.white,
                    margin: EdgeInsetsDirectional.only(
                        start: mqw * 0.05, end: mqw * 0.05),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
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
                                color: Colors.black.withOpacity(.5),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: mqh * 0.04,
                          ),
                          SizedBox(
                            height: mqh * 0.06,
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              textAlignVertical: TextAlignVertical.center,
                              controller: _password,
                              obscureText: isPassword,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                fontFamily: "Besley-Regular",
                                color: Colors.black,
                              ),
                              onChanged: (value) {
                                print("_password${_password.text}");
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password must not be null';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isPassword
                                        ? Icons.remove_red_eye
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isPassword = !isPassword;
                                    });
                                  },
                                ),
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 23,
                                  fontFamily: "Besley-Regular",
                                  color: Colors.black.withOpacity(.5),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: mqh * 0.04,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: RaisedButton(
                              padding: const EdgeInsetsDirectional.all(15),
                              onPressed: () {
                                login();
                              },
                              color: const Color.fromRGBO(106, 144, 242, 1),
                              textColor: Colors.white70,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  fontFamily: "Tajawal",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, ResetPassword.routeName);
                              },
                              child: const Text(
                                'Forgot password ?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  fontFamily: "Besley-Bold",
                                  color:
                                      const Color.fromRGBO(106, 144, 242, 1),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don’t have an account?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    fontFamily: "Besley-Regular",
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, SignUp.routeName);
                                  },
                                  child: const Text(
                                    'Sign up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      fontFamily: "Besley-Bold",
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future login() async{
    if (formKey.currentState!.validate()) {
      UserCredential? user = await FirebaseAuthController.firebaseAuthHelper
          .signIn(Users(
          email: _email.text, password: _password.text));
      if (user != null) {
        Future.delayed(Duration(seconds: 4), () {
          Navigator.pushNamed(context, TabScreen.routePage);
          _email.clear();
          _password.clear();
        });
      }
    }
  }
}
