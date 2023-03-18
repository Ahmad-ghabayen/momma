import 'package:flutter/material.dart';
import 'package:momma/view/screen/Payment/Payment.dart';
import 'package:momma/view/widget/defaultBotton.dart';
import 'package:momma/modle/product.dart';
import 'package:momma/view/widget/tapBar.dart';

class Cart extends StatefulWidget {
  final data;
  final id;

  Cart({super.key, this.data, this.id});

  @override
  State<Cart> createState() => _CartState();
  static const routePage = '/Cart';
}

int countPrice = 0;
late List<Product> products = [];

class _CartState extends State<Cart> {
  @override
  void initState() {
    if (widget.data != null) {
      products.add(widget.data);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mqh = MediaQuery.of(context).size.height;
    final mqw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Besley-Bold",
            letterSpacing: 2,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: mqh * 0.012, left: mqw * 0.04),
            child: Row(
              children: [
                Text(
                  "${products.length} items available",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child:ListView.builder(
                        itemCount:products.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(
                                height: mqh * 0.012,
                              ),
                              Card(
                                elevation: 2,
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: mqw * 0.01),
                                      width: mqw * 0.20,
                                      child: AspectRatio(
                                        aspectRatio: 0.9,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      products[index].image!))),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: mqw * 0.03,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${products[index].title}",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: mqh * 0.0065,
                                        ),
                                        const Text(
                                          "from boots category",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 17),
                                        ),
                                        SizedBox(
                                          height: mqh * 0.0065,
                                        ),
                                        Text.rich(TextSpan(
                                            text:
                                                " \$${products[index].price} ",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600))),
                                      ],
                                    ),
                                    SizedBox(
                                      width: mqw * 0.06,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: mqh * 0.009,
                                              left: mqw * 0.09),
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                products.removeAt(index);
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.remove_shopping_cart,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: mqh * 0.04,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                bottom: mqh * 0.02,
                                              ),
                                              width: mqw * 0.07,
                                              height: mqh * 0.07,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.grey[350]),
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.minimize,
                                                  size: 15,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    if (products[index].countItem! >1)
                                                      products[index].countItem;
                                                  });
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: mqw * 0.013,
                                            ),
                                            Text(
                                              " ${products[index].countItem}",
                                              style:
                                                  const TextStyle(fontSize: 17),
                                            ),
                                            SizedBox(
                                              width: mqw * 0.013,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  bottom: mqh * 0.02,
                                                  top: mqh * 0.01),
                                              width: mqw * 0.07,
                                              height: mqh * 0.07,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.grey[350]),
                                              child: Center(
                                                child: Center(
                                                  child: IconButton(
                                                    icon: const Icon(
                                                      Icons.add,
                                                      size: 15,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        if (products[index].countItem! >= 1)
                                                          products[index].countItem;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        })
                  ),
            ),
          Container(
            padding: EdgeInsets.only(
                top: mqh * 0.02, left: mqw * 0.04, right: mqw * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Sub total:",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                Text(
                  " \$100",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: mqh * 0.02, left: mqw * 0.04, right: mqw * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Tax(15%):",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                Text(
                  " \$15 ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: mqh * 0.009,
          ),
          const Divider(
            color: Colors.black45,
            height: 2,
          ),
          Container(
            padding: EdgeInsets.only(
                top: mqh * 0.025, left: mqw * 0.04, right: mqw * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text(
                  " \$215 ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: mqh * 0.02,
          ),
          Container(
              padding: EdgeInsets.only(
                  top: mqh * 0.02,
                  left: mqw * 0.04,
                  right: mqw * 0.04,
                  bottom: mqh * 0.01),
              child: DefaultBotton(
                  title: "Checkout", routPage: PaymentMode.routePage)),
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.only(
                  top: mqh * 0.01,
                  left: mqw * 0.08,
                  right: mqw * 0.08,
                  bottom: mqh * 0.01),
              child: RaisedButton(
                padding: const EdgeInsets.all(15),
                onPressed: () {
                  showDialog(
                      barrierColor: Colors.black.withOpacity(0.85),
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                                top: mqh * 0.06,
                                right: mqw * 0.03,
                                left: mqw * 0.03),
                            width: mqw * 0.8,
                            height: mqh * 0.5,
                            child: Column(
                              children: [
                                const Image(
                                  image: AssetImage(
                                    "assets/images/cancel.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: mqh * 0.05,
                                ),
                                Text(
                                  "Are you sure you want to cancel this order?",
                                  style: TextStyle(
                                      fontSize: 23,
                                      letterSpacing: 2,
                                      color: Colors.black.withOpacity(0.7)),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: mqh * 0.02,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => TabScreen(
                                                  data: widget.data,
                                                  id: widget.id)));
                                    },
                                    padding: const EdgeInsets.all(15),
                                    color: Colors.blueAccent,
                                    textColor: Colors.white70,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                        fontFamily: "Tajawal",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: mqh * 0.02,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    padding: const EdgeInsets.all(15),
                                    color: Colors.white,
                                    textColor: Colors.white70,
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "Not Now!",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontFamily: "Tajawal",
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.white70,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "Cancel Order",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    fontFamily: "Tajawal",
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: mqh * 0.01,
          ),
        ],
      ),
    );
  }
// void getData()async{
//   var collection = FirebaseFirestore.instance.collection('Cart');
//   var querySnapshots = await collection.get();
//   for (var snapshot in querySnapshots.docs) {
//     var documentID = snapshot.id; // <-- Document ID
//     print(documentID);
//   }
//
// }
}
