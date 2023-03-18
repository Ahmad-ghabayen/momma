import 'package:flutter/material.dart';
import 'package:momma/modle/product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function() press;

   ItemCard({required this.product,required this.press});

  @override
  Widget build(BuildContext context) {
    final mqh= MediaQuery.of(context).size.height;
    final mqw= MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: press,
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
                  color: Colors.grey,
                )),
            Center(
              child: Container(
                padding:  EdgeInsets.only(right: mqw * 0.03,left: mqw * 0.03,bottom: mqh * 0.01),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),  ),

                child: Image.asset(
                  product.image!,fit: BoxFit.cover,width: mqw * 0.4,height: mqw * 0.3, ),
              ),
            ),
            Container(
              height: mqh * 0.03,
              child: Center(
                child: Text(
                  product.title!,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
            SizedBox(
              height: mqh * 0.005,
            ),
            Container(
              height: mqh * 0.033,
              child: Center(
                child: Text(
                  " \$ ${product.price}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
