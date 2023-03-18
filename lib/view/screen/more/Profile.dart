import 'package:flutter/material.dart';
import 'package:momma/view/widget/defaultBotton.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
  static const routePage = '/Profile';
}

class _ProfileState extends State<Profile> {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController phone;
  var formKey;

  @override
  void initState() {
    email = TextEditingController();
    lastName = TextEditingController();
    phone = TextEditingController();
    firstName = TextEditingController();
    formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    lastName.dispose();
    phone.dispose();
    firstName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqh = MediaQuery.of(context).size.height;
    final mqw = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData.fallback(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: mqh * 0.17,
                  width: mqw * 0.35,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                ),
              ),
              SizedBox(
                height: mqh * 0.017,
              ),
              const Text(
                "John Deo",
                style: TextStyle(
                    fontSize: 25, letterSpacing: 2, color: Colors.black87),
              ),
              SizedBox(
                height: mqh * 0.001,
              ),
              const Text(
                "johndeo@yourmail.com",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              SizedBox(
                height: mqh * 0.05,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text("Orders Count"),
                        SizedBox(
                          height: mqh * 0.005,
                        ),
                        const Text(
                          "13",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Total Paid"),
                        SizedBox(
                          height: mqh * 0.005,
                        ),
                        const Text("2342.55 \$",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mqh * 0.01,
              ),
              const Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: firstName,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 25,
                        fontFamily: "Besley-Medium",
                        color: Colors.black,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'First name must not be null';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        hintText: "First Name",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 23,
                          fontFamily: "Besley-Regular",
                          color: Colors.black.withOpacity(.5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mqh * 0.012,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: lastName,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 25,
                        fontFamily: "Besley-Medium",
                        color: Colors.black,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'First name must not be null';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        hintText: "Last Name",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 23,
                          fontFamily: "Besley-Regular",
                          color: Colors.black.withOpacity(.5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mqh * 0.012,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: email,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 25,
                        fontFamily: "Besley-Medium",
                        color: Colors.black,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'First name must not be null';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
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
                      height: mqh * 0.012,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: phone,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 25,
                        fontFamily: "Besley-Medium",
                        color: Colors.black,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'First name must not be null';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        hintText: "phone",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 23,
                          fontFamily: "Besley-Regular",
                          color: Colors.black.withOpacity(.5),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: mqh * 0.012,
              ),
              DefaultBotton(title: "Save", routPage: Profile.routePage)
            ],
          ),
        ),
      ),
    );
  }
}
