import 'package:flutter/material.dart';
import 'package:momma/modle/product.dart';

class OrdersHistory extends StatefulWidget {

  final  data;

  const OrdersHistory({super.key, this.data});
  @override
  State<OrdersHistory> createState() => _OrdersHistoryState();
}
late List<Product> products = [];

class _OrdersHistoryState extends State<OrdersHistory> {

  @override
  void initState(){
    if(widget.data != null){
      if (products.isEmpty){
        products.add(widget.data);
      }
      else{
        products.clear();
        products.add(widget.data);
      }

    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mqh= MediaQuery.of(context).size.height;
    final mqw= MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order History',
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
            padding:  EdgeInsets.only(top: mqh *0.01, left: mqw *0.05),
            child: Row(
              children: [
                Text(
                  "${products.length} Orders",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
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
                        Card(
                          elevation: 3,
                          child: Row(
                            children: [
                              SizedBox(
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
                                width: mqw * 0.035,
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
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
