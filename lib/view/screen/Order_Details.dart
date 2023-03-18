import 'package:flutter/material.dart';
import 'package:momma/modle/product.dart';


class OrderDetails extends StatefulWidget {
  final  data;
  final id;

  OrderDetails({super.key, this.data,this.id});
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
  static const routePage = '/OrderDetails';
}
late List<Product> products = [

];

class _OrderDetailsState extends State<OrderDetails> {
  int indexNum = 1;

  @override
  void initState() {
      if(widget.data != null) {

        if(products.isEmpty){
          products.add(widget.data);
        }
        else{
            for(int index=0 ; index<products.length; index++){
              if(products[index].id == widget.id){
                return null;
              }
              else products.add(widget.data) ;
            }


        }
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final mqh= MediaQuery.of(context).size.height;
    final mqw= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Details',
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
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                  itemCount: products.length,
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
                                padding: EdgeInsets.only(left: mqw *0.01),
                                width: mqw * 0.23,
                                child: AspectRatio(
                                  aspectRatio: 0.9,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                products[index].image!))),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: mqw * 0.04,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (products[index].title!),
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.black),
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
                                      text: " \$${products[index].price}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600))),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ),
           SizedBox(
            height: mqh *0.01,
          ),
          Container(
            padding:  EdgeInsets.only(top: mqh * 0.02, left: mqw * 0.04, right:  mqw * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Sub total:",
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
                Text(
                  " \$100 ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ],
            ),
          ),
          Container(
            padding:  EdgeInsets.only(top: mqh * 0.02, left: mqw * 0.04, right:  mqw * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Tax(15%):",
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
                Text(
                  " \$15 ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ],
            ),
          ),
          SizedBox(
            height: mqh *0.014,
          ),
           Divider(
            color: Colors.black45,
            height: mqh * 0.003,
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total:",
                  style: TextStyle(fontSize: 19, color: Colors.black45),
                ),
                Container(
                  width: mqw *0.18,
                  height: mqh *0.06,
                  //padding: EdgeInsets.only(right: 17,left: 17),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(106, 144, 242, 1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Center(
                    child: Text(
                      " \$215 ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
           SizedBox(
            height: mqh * 0.1,
          ),
        ],
      ),
    );
  }
}
