import 'package:flutter/material.dart';
import 'package:momma/view/widget/tapBar.dart';
import 'package:momma/view/widget/toast.dart';
import 'package:string_validator/string_validator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../firebase/firebase_auth.dart';
import '../../../modle/users.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  static const routeName = '/SignUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController _email;
  late TextEditingController _phone;
  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _password;
  late bool isPassword = true;
  var formKey;
  bool isAccept = false;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _phone = TextEditingController();
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    isPassword = true;
    formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
    _phone.dispose();
    _firstName.dispose();
    _lastName.dispose();
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
          iconTheme: const IconThemeData.fallback(),
        ),
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.only(left: mqw*0.02, top: mqh*0.02, right:  mqw*0.02),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin:  EdgeInsets.only(top: mqh*0.01),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Besley-Bold",
                          letterSpacing: 2,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Create an account",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontFamily: "Besley-Regular",
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                     SizedBox(
                      height: mqh * 0.03,
                    ),
                    Container(
                      width: mqw * 0.9,
                      height: mqh * 0.6,
                      color: Colors.white,
                      margin:
                           EdgeInsetsDirectional.only(start: mqw *0.04, end:  mqw *0.04),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildTextFormField(
                                  _firstName,
                                  TextInputType.text,
                                  'First name must not be null',
                                  "First Name",),
                               SizedBox(
                                height: mqh *0.02,
                              ),
                              buildTextFormField(
                                  _lastName,
                                  TextInputType.text,
                                  'Address must not be null',
                                  "Last Name",),
                              SizedBox(
                                height: mqh *0.02,
                              ),                              buildTextFormField(
                                  _email,
                                  TextInputType.text,
                                  'Email must not be null',
                                  "Email",
                                  ),
                              SizedBox(
                                height: mqh *0.02,
                              ),
                              buildTextFormField(
                                  _phone,
                                  TextInputType.number,
                                  'Phone number must not be null',
                                  "Phone",
                                  ),
                              SizedBox(
                                height: mqh *0.02,
                              ),
                              SizedBox(
                                height: 45,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  textAlignVertical: TextAlignVertical.center,
                                  controller: _password,
                                  obscureText: isPassword,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                    fontFamily: "Besley-Regular",
                                    color: Colors.black,
                                  ),
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
                                height: mqh * 0.08,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: mqh *0.08,
                                child: RaisedButton(
                                  padding: const EdgeInsetsDirectional.all(20),
                                  onPressed: () {
                                    createAccount();
                                    },
                                  color: const Color.fromRGBO(106, 144, 242, 1),
                                  textColor: Colors.white70,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Text(
                                    "Sign up",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20,
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
  void createAccount() async {
    if (formKey.currentState!.validate()) {

      // Reference ref = FirebaseStorage.instance
      //     .ref()
      //     .child("profileImage_${username.text}");
      // await ref.putFile(File(controller.file!.path));
      // String url = await ref.getDownloadURL();
      FirebaseAuthController.firebaseAuthHelper.createAccount(Users(
        email: _email.text,
        password: _password.text,
        lastName: _lastName.text,
        firstName: _firstName.text,
        phone: _phone.text,
        // image: url,
      ));

      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushNamed(
            context, TabScreen.routePage);
      });
     _email.clear();
      _password.clear();
      _firstName.clear();
      _lastName.clear();
      _phone.clear();

    }
  }

  TextFormField buildTextFormField(
      TextEditingController controller,
      TextInputType keyboardType,
      String toast,
      String hintText,
      ) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      style: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 22,
        fontFamily: "Besley-Medium",
        color: Colors.black,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return toast;
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 23,
          fontFamily: "Besley-Regular",
          color: Colors.black.withOpacity(.5),
        ),
      ),
    );
  }
}
