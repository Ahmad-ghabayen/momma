import 'package:flutter/material.dart';
import 'package:momma/modle/product.dart';
import 'package:momma/view/screen/home/itemCard.dart';

import 'Product _Details.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);
  static const routePage= '/Search';

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController search;
  @override
  void initState() {
search = TextEditingController();
super.initState();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final mqh= MediaQuery.of(context).size.height;
    final mqw= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
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
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Padding(
                  padding:  EdgeInsets.only(right: mqw *0.04,left: mqw *0.04,),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: search,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      fontFamily: "Besley-Medium",
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search),
                      hintText: "Product Name…",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        fontFamily: "Besley-Regular",
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                  ),
                ),
              ),
               Padding(padding: EdgeInsets.symmetric(vertical: mqh *0.01)),
              Expanded(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: mqw *0.05),
                    child: GridView.builder(
                        itemCount: Product.listProducts.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) => ItemCard(
                            product: Product.listProducts[index],
                            press:()=> Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>ProductDetails(product: Product.listProducts[index]) )))
                    ),
                  )),
            ]),
      ),
    );
  }
}
