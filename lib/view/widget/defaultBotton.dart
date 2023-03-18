import 'package:flutter/material.dart';

class DefaultBotton extends StatelessWidget {
  final String title;
  final String routPage ;
   DefaultBotton({required this.title, required this.routPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: RaisedButton(
          padding: const EdgeInsetsDirectional.all(15),

          onPressed: () {
           Navigator.pushNamed(context, routPage);
          },

          color: const Color.fromRGBO(106, 144, 242, 1),
          textColor: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child:  Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "Tajawal",
              color: Colors.white,
            ),
          ),

          ),
        ),
      );
  }
}
