import 'package:flutter/material.dart';
import 'package:momma/view/screen/Payment/PaymentSuccessful.dart';
import 'package:momma/view/widget/defaultBotton.dart';

class PaymentMode extends StatefulWidget {
  const PaymentMode({Key? key}) : super(key: key);

  @override
  State<PaymentMode> createState() => _PaymentModeState();

  static const routePage = "/PaymentMode";
}

class _PaymentModeState extends State<PaymentMode> {
  late TextEditingController numCard;
  late TextEditingController EXPIRY;
  late TextEditingController CCV;
  var formKey;

  @override
  void initState() {
    numCard = TextEditingController();
    EXPIRY = TextEditingController();
    CCV = TextEditingController();

    formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    numCard.dispose();
    EXPIRY.dispose();
    CCV.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqh = MediaQuery.of(context).size.height;
    final mqw = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Payment Mode",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Besley-Bold",
              letterSpacing: 2,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData.fallback(),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: const Color.fromRGBO(106, 144, 242, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.credit_card,
                                color: Colors.white,
                                size: 40,
                              )),
                        ),
                        SizedBox(
                          height: mqh * 0.037,
                        ),
                        Container(
                          width: mqw * 0.6,
                          height: mqh * 0.06,
                          padding: EdgeInsets.only(
                              left: mqw * 0.05, top: mqh * 0.03),
                          child: const Text(
                            "1234 5678 9876 5432",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: mqw * 0.05, top: 3),
                          child: const Text(
                            "1234",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(
                                left: mqw * 0.05,
                                top: mqh * 0.035,
                                right: mqw * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "James Born",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "EXPIRY",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "03/17",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  ],
                                )
                              ],
                            )),
                        SizedBox(
                          height: mqh * 0.033,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: mqh * 0.06,
                ),
                Padding(
                  padding: EdgeInsets.only(left: mqw * 0.05),
                  child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: numCard,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              fontFamily: "Besley-Medium",
                              color: Colors.black,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'num Card must not be null';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              print(value);
                            },
                            decoration: InputDecoration(
                              hintText: "6524 2541 2164",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  fontFamily: "Besley-Regular",
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                          ),
                          SizedBox(
                            height: mqh * 0.02,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: EXPIRY,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              fontFamily: "Besley-Medium",
                              color: Colors.black,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'EXPIRY must not be null';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              print(value);
                            },
                            decoration: InputDecoration(
                              hintText: "MM/YY",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  fontFamily: "Besley-Regular",
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                          ),
                          SizedBox(
                            height: mqh * 0.02,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: numCard,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              fontFamily: "Besley-Medium",
                              color: Colors.black,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'CCV must not be null';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              print(value);
                            },
                            decoration: InputDecoration(
                              hintText: "CCV",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  fontFamily: "Besley-Regular",
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                          ),
                          SizedBox(
                            height: mqh * 0.06,
                          ),
                          DefaultBotton(
                              title: "Proceed",
                              routPage: PaymentSuccessful.routePage),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
