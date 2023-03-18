import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  static const routePage = '/About';

  @override
  Widget build(BuildContext context) {
    final mqh= MediaQuery.of(context).size.height;
    final mqw= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData.fallback(),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 20, right: 10),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: mqw * 0.78 ,
                      height:  mqh * 0.08,
                      // height:
                      child: const Text(
                        "MOMMA.",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Besley-Bold",
                          letterSpacing: 15,
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mqh *0.009,
                    ),
                    Text("FASHIONS",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                            letterSpacing: 3)),
                    SizedBox(
                      height: mqh *0.01,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("About",
                                    style: TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.75))),
                                SizedBox(
                                  height: mqh *0.014,
                                ),
                                Text(
                                  "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical professor.",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey[700]),
                                ),
                                SizedBox(
                                  height: mqh *0.019,
                                ),
                                const Divider(thickness: 2,),
                                SizedBox(
                                  height: mqh *0.019,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(image: AssetImage("assets/images/about1.png",),fit: BoxFit.fill,width: mqw *0.43,height: mqh *0.22 ,),
                                    Image(image: AssetImage("assets/images/about2.png"),fit: BoxFit.fill,width: mqw *0.43,height: mqh *0.22 ),

                                      ],
                                ),
                                SizedBox(height: 15,),
                                Image(image: AssetImage ("assets/images/about3.jpg"),width: double.infinity,fit: BoxFit.cover,height: mqh *0.21 , )
                                



                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
