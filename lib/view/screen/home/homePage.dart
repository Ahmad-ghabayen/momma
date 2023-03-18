import 'package:flutter/material.dart';
import 'package:momma/view/screen/authentication/sign_in.dart';
import 'package:momma/view/screen/more/Profile.dart';
import 'package:momma/view/screen/search.dart';

import '../../widget/DrawerItem.dart';
import '../cart.dart';
import '../more/more.dart';
import 'body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routName = "/HomePage ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 25, color: Colors.white,fontFamily: "Besley-Bold",),
        ),
        elevation: 1,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Search.routePage);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 25,
              ))
        ],
      ),
      body: Body(),
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              return Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                   CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                       radius: 50
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        snapshot.data['firstName'],
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        snapshot.data['lastName'],
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                   DrawerItem(name: "Profile",
                      icon: Icons.person,
                       onTap: (){
                         Navigator.pushNamed(context, Profile.routePage);
                       }),
                   Divider(
                    color: Colors.black.withOpacity(0.5),
                    endIndent: 10,
                    indent: 10,
                  ),
                   DrawerItem(name: "Cart",
                       icon: Icons.shopping_cart, onTap: (){
                     Navigator.pushNamed(context, Cart.routePage);
                       }),
                  Divider(
                    color: Colors.black.withOpacity(0.5),
                    endIndent: 10,
                    indent: 10,
                  ),
                   DrawerItem(
                    name: "Settings",
                    icon: Icons.settings,
                       onTap: (){
                         Navigator.pushNamed(context, More.routePage);
                       }
                  ),
                   Divider(
                     color: Colors.black.withOpacity(0.3),
                     endIndent: 10,
                    indent: 10,
                  ),
                  DrawerItem(
                    name: "Logout",
                    icon: Icons.logout,
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, SignIn.routName);
                    },
                  ),
                   Divider(
                    color: Colors.black.withOpacity(0.3),
                     endIndent: 10,
                    indent: 10,
                  ),
                ],
              );
            },
          )),
    );
  }
}
