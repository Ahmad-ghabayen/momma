import 'dart:async';

import 'package:flutter/material.dart';
import 'package:momma/view/screen/main.dart';
import 'package:momma/view/screen/onBoarding/onBoarding.dart';

import '../../firebase/firebase_auth.dart';
import '../widget/tapBar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      if (FirebaseAuthController.firebaseAuthHelper.isLoggedIn()) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => TabScreen()));
      }else{


      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => OnBoarding()));
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            const Image(
              image: AssetImage(
                'images/splash.jpg',
              ),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 170,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  const [
                    Text( "M O M M A",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      "FASHIONS",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
