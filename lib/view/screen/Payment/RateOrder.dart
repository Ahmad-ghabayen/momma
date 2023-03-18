import 'package:flutter/material.dart';
import "package:flutter_rating_bar/flutter_rating_bar.dart";
import 'package:momma/view/widget/tapBar.dart';
import '../../widget/defaultBotton.dart';

class RateOrder extends StatefulWidget {
  const RateOrder({Key? key}) : super(key: key);

  @override
  State<RateOrder> createState() => _RateOrderState();

  static const routePage = '/RateOrder ';
}

class _RateOrderState extends State<RateOrder> {
  double rating =0;

  @override
  Widget build(BuildContext context) {
    final mqh= MediaQuery.of(context).size.height;
    final mqw= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: mqh * 0.12,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "How was your order experiences from it Momma?",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black.withOpacity(0.77),
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: mqh * 0.03,
                  ),

                  Container(
                    width:mqw *0.64 ,
                    height:mqh *0.06 ,
                    child: RatingBar.builder(
                      minRating: 1,
                      maxRating: 5,
                      itemPadding: const EdgeInsets.only(right: 10),

                      itemBuilder: (BuildContext context,_) {
                        return const Icon(Icons.star,color: Colors.blueAccent,);
                      },
                      onRatingUpdate: (rating) {
                        setState(() {
                          this.rating = rating;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: mqh * 0.036,
                  ),
                  DefaultBotton(title: "SUBMIT", routPage: TabScreen.routePage),
                  SizedBox(
                    height: mqh * 0.02,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child:  Text(
                      'Not now!',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        fontFamily: "Besley-Bold",
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
