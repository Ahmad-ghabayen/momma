import 'package:flutter/material.dart';
import 'package:momma/view/widget/defaultBotton.dart';

import 'RateOrder.dart';

class PaymentSuccessful extends StatefulWidget {
  const PaymentSuccessful({Key? key}) : super(key: key);

  @override
  State<PaymentSuccessful> createState() => _PaymentSuccessfulState();

  static const routePage = '/PaymentSuccessful';
}

class _PaymentSuccessfulState extends State<PaymentSuccessful> {
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
              height: mqh * 0.13,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/images/sucsessful.png"),width: mqw *0.27,height: mqh *0.17,),
                    SizedBox(
                      height: mqh * 0.019,
                    ),
                    Text(
                      "Payment Successful!",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black.withOpacity(0.77),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height:  mqh * 0.019,
                    ),
                    Text(
                      " We have emailed you the receipt.",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height:  mqh * 0.036,),
                    
                    DefaultBotton(title: "Finish!", routPage: RateOrder.routePage)
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
