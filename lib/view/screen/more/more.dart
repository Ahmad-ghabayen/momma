import 'package:flutter/material.dart';
import 'package:momma/view/screen/more/Favorites.dart';
import 'package:momma/view/screen/more/OrdersHistory.dart';
import 'package:momma/view/screen/more/about.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Order_Details.dart';
import 'Profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class More extends StatefulWidget {
  final data;
  final id;

  More({super.key, this.data, this.id});

  @override
  State<More> createState() => _MoreState();
  static const routePage = '/Cart';

}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    final mqh= MediaQuery.of(context).size.height;
    final mqw= MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child:
      StreamBuilder<DocumentSnapshot>(
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
                height: mqh *0.11,
              ),
              Center(
                child: SizedBox(
                  height: mqh *0.18,
                  width: mqw *0.38,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                ),
              ),
              SizedBox(
                height: mqh *0.013,
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
                height: mqh *0.005,
              ),
               Text(
                snapshot.data['email']      ,
                 style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
// Padding(padding: const EdgeInsets.symmetric( vertical: 10),
//   child:
              SizedBox(
                height: mqh *0.03,
              ),
              buildCard("My Profile", Icons.person, Profile.routePage),
              buildCard("Favorites", Icons.favorite, Favorites.routePage),
              Card(
                child: FlatButton(
                  padding: const EdgeInsets.all(18),
                  color: const Color(0xfff5f6f9),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                OrderDetails(data: widget.data, id: widget.id)));
                  },
                  child: Row(
                    children:  [
                      const Icon(
                        Icons.task_sharp,
                        color: Colors.grey,
                        size: 30,
                      ),
                      SizedBox(
                        width: mqw *0.07,
                      ),
                      const Text(
                        "Orders",
                        style: TextStyle(color: Colors.grey, fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              buildCard("Terms & Conditions", Icons.shield, ""),
              buildCard("Privacy Policy", Icons.lock, ""),
              Card(
                child: FlatButton(
                  padding: const EdgeInsets.all(18),
                  color: const Color(0xfff5f6f9),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrdersHistory(data: widget.data))),
                  child: Row(
                    children:  [
                      const Icon(
                        Icons.history,
                        color: Colors.grey,
                        size: 30,
                      ),
                      SizedBox(
                        width: mqw *0.07,
                      ),
                      const Text(
                        "Order History",
                        style: TextStyle(color: Colors.grey, fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              buildCard("About", Icons.info, About.routePage),
              buildCard("Logout", Icons.logout, ""),

// )
            ],
          );
        },
      )

        ));
  }

  Card buildCard(String title, IconData icon, String pageRoute) {
    return Card(
      child: FlatButton(
        padding: const EdgeInsets.all(18),
        color: const Color(0xfff5f6f9),
        onPressed: () {
          Navigator.pushNamed(context, pageRoute);
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey,
              size: 30,
            ),
             SizedBox(
              width: MediaQuery.of(context).size.width*0.07,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}







///////////////////


