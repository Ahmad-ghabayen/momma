import 'package:flutter/material.dart';
import 'package:momma/modle/product.dart';
import '../Product _Details.dart';
import 'category.dart';
import 'itemCard.dart';
import 'my_slider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mqh= MediaQuery.of(context).size.height;
    final mqw= MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Padding(padding: EdgeInsets.symmetric(horizontal: mqw * 0.07)),
        Categories(),
        MySlider(),
        Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: mqw * 0.07),
              child: GridView.builder(
                  itemCount: Product.listProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.64,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                        product: Product.listProducts[index],
                        press:()=> Navigator.push(
                            context, MaterialPageRoute(builder: (context) =>ProductDetails(product: Product.listProducts[index]) )))
                  ),
            )),
      ],
    );
  }
}
