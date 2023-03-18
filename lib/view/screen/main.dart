import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:momma/view/screen/more/Favorites.dart';
import 'package:momma/view/screen/Payment/Payment.dart';
import 'package:momma/view/screen/Payment/PaymentSuccessful.dart';
import 'package:momma/view/screen/Payment/RateOrder.dart';
import 'package:momma/view/screen/more/more.dart';
import 'package:momma/view/screen/search.dart';
import 'package:momma/view/screen/Verify.dart';
import 'package:momma/view/screen/cart.dart';
import 'package:momma/view/screen/authentication/reset_password.dart';
import 'package:momma/view/screen/authentication/sign_in.dart';
import 'package:momma/view/screen/authentication/sign_up.dart';
import 'package:momma/view/screen/splash_screen.dart';
import 'package:momma/view/screen/home/homePage.dart';
import 'package:momma/view/widget/tapBar.dart';
import 'more/Profile.dart';
import 'more/about.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context)=> SplashScreen(),
        SignIn.routName:(context)=> SignIn(),
        HomePage.routName: (context)=>HomePage(),
        ResetPassword.routeName: (context)=>ResetPassword(),
        SignUp.routeName: (context)=> SignUp(),
        VerifyAccount.routeName: (context) => VerifyAccount(),
        TabScreen.routePage: (context) => TabScreen(),
        Search.routePage: (context) => Search(),
        Cart.routePage: (context) => Cart(),
        PaymentMode.routePage: (context)=> PaymentMode(),
        PaymentSuccessful.routePage: (context)=> PaymentSuccessful(),
        RateOrder.routePage: (context)=> RateOrder(),
        Profile.routePage: (context)=> Profile(),
        Favorites.routePage: (context)=> Favorites(),
        About.routePage: (context)=> About(),
        More.routePage: (context)=>More(),

      },
    );
  }
}

