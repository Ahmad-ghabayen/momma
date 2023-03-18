import 'package:flutter/material.dart';
import 'package:momma/view/widget/defaultBotton.dart';
import 'package:momma/view/widget/tapBar.dart';


class VerifyAccount extends StatefulWidget {
  const VerifyAccount({Key? key}) : super(key: key);
  static const routeName= '/VerifyAccount';

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  @override
  Widget build(BuildContext context) {
    final mqh= MediaQuery.of(context).size.height;
    final mqw= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData.fallback(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(left: mqw * 0.04, top: mqh * 0.03, right: mqw * 0.04),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: mqh* 0.045,
                    margin:  EdgeInsetsDirectional.only(
                      top: mqh * 0.1,
                    ),
                    child:  Text(
                      "Verify Your Account",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontFamily: "Besley-Bold",
                        letterSpacing: 2,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                   SizedBox(
                    height: mqh * 0.04,
                  ),
                   Text(
                    "We are sending OTP to validate your mobile number. Hang on!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: "Besley-Regular",
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: mqh * 0.04,
                  ),
                  Row(
                    children:  const [
                    OptForm(),

                  ],),
                   SizedBox(height: mqh * 0.04,),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SMS has been sent to ',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            fontFamily: "Besley-Regular",
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        const Text(
                          '1800 123 4567',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            fontFamily: "Besley-Bold",
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: mqh * 0.04,),
                  DefaultBotton(title: "Submit", routPage: TabScreen.routePage)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OptForm extends StatefulWidget {
  const OptForm({Key? key}) : super(key: key);

  @override
  State<OptForm> createState() => _OptFormState();
}

class _OptFormState extends State<OptForm> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();

    super.initState();
  }

  void nextField ({required String value , required FocusNode focusNode}){
    if(value.length==1){
      focusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqw= MediaQuery.of(context).size.width;
    final mqh= MediaQuery.of(context).size.height;

    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
           SizedBox(width: mqw* 0.05,),
          Container(
            width: mqw * 0.16,
            height: mqh * 0.085,
            decoration:  BoxDecoration(
                color: const Color.fromRGBO(106, 144, 242, 1),
              borderRadius: BorderRadius.circular(10)
              ) ,
            child: TextFormField(
              cursorColor: Colors.white,
              autofocus: true,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                enabledBorder: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder(),
                border: buildOutlineInputBorder(),
              ),
              textAlign: TextAlign.center,
              onChanged: (value) {
                nextField(value: value , focusNode: pin2FocusNode);
              },
            ),
            ),


          SizedBox(width: mqw* 0.08,),
          Container(
            decoration:  BoxDecoration(
                color: const Color.fromRGBO(106, 144, 242, 1),
                borderRadius: BorderRadius.circular(10)
            ) ,
            width: mqw * 0.16,
            height: mqh * 0.085,
            child: TextFormField(
              cursorColor: Colors.white,
              focusNode: pin2FocusNode,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                enabledBorder: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder(),
                border: buildOutlineInputBorder(),
              ),
              textAlign: TextAlign.center,
              onChanged: (value) {
                nextField(value: value , focusNode: pin3FocusNode);
              },
            ),
          ),
          SizedBox(width: mqw* 0.08,),
          Container(
            width: mqw * 0.15,
            height: mqh * 0.085,

            decoration:  BoxDecoration(
                color: const Color.fromRGBO(106, 144, 242, 1),
                borderRadius: BorderRadius.circular(10)
            ) ,
            child: TextFormField(
              cursorColor: Colors.white,
              focusNode: pin3FocusNode,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                enabledBorder: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder(),
                border: buildOutlineInputBorder(),
              ),
              textAlign: TextAlign.center,
              onChanged: (value) {
                nextField(value: value , focusNode: pin4FocusNode);
              },
            ),
          ),
          SizedBox(width: mqw* 0.06,),
          Container(
            width: mqw * 0.15,
            height: mqh * 0.085,

            decoration:  BoxDecoration(
                color: const Color.fromRGBO(106, 144, 242, 1),
                borderRadius: BorderRadius.circular(10)
            ) ,
            child: TextFormField(
              cursorColor: Colors.white,
              focusNode: pin4FocusNode,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                enabledBorder: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder(),
                border: buildOutlineInputBorder(),
              ),
              textAlign: TextAlign.center,
              onChanged: (value) {pin4FocusNode.unfocus();},
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide( color: Color.fromRGBO(106, 144, 242, 1),
      ),

    );
  }
}
