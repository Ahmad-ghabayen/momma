import 'package:flutter/material.dart';
import 'package:momma/modle/product.dart';

import '../Product _Details.dart';


class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
  static const routePage = '/Favorites';
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    final mqh= MediaQuery.of(context).size.height;
    final mqw= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
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
              Padding(padding: EdgeInsets.symmetric(vertical: mqh *0.01)),
            Expanded(
                child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: mqw *0.05),
              child: GridView.builder(
                  itemCount: Product.listProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.63,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) =>

                      GestureDetector(
                        onTap: ()=>Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetails(
                                    product: Product.listProducts[index]))),
                        child: Card(
                          elevation: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              SizedBox(height: mqh * 0.005,),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )),
                              Center(
                                child: Container(
                                  padding:  EdgeInsets.only(right: mqw * 0.03,left: mqw * 0.03,bottom: mqh * 0.01),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),  ),

                                  child: Image.asset(
                                    Product.listProducts[index].image!,fit: BoxFit.cover,width: mqw *0.3,height: mqh * 0.16, ),
                                ),
                              ),
                              Container(
                                height: mqh * 0.03,
                                child: Center(
                                  child: Text(
                                    Product.listProducts[index].title!,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                  ),
                                ),
                              ),
                               SizedBox(
                                height: mqh* 0.005,
                              ),
                              Container(
                                height: mqh * 0.033,
                                child: Center(
                                  child: Text(
                                    " \$ ${ Product.listProducts[index].price}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
            )),
          ],
        ),
      ),
    );
  }

  // ItemCard(
  // product: Product.listProducts[index],
  // press: () => Navigator.push(
  // context,
  // MaterialPageRoute(
  // builder: (context) => ProductDetails(
  // product: Product.listProducts[index]))))
}
