import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:momma/modle/product.dart';
import '../widget/toast.dart';
import 'cart.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ProductDetails extends StatelessWidget {
  final Product product;
  ProductDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    final mqh= MediaQuery.of(context).size.height;
    final mqw= MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Product Details',
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
            children: [
              Container(
                padding:  EdgeInsets.only(right: mqw *0.06),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: mqw *0.07,
                    height:  mqh *0.07,
                    decoration: const BoxDecoration(
                      color: Colors.white30,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Container(
                 padding:  EdgeInsets.only(right: mqw *0.03,left: mqw *0.03,),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        product.image!,
                        fit: BoxFit.fill,
                        width: mqw *0.6,
                        height: mqh *0.25,
                      ),
                    ),
                     SizedBox(
                      height: mqh *0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.title!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        Text(
                          "${product.price} \$ ",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ],
                    ),
                     SizedBox(
                      height:mqh *0.015,
                    ),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Bags",
                          style: TextStyle(color: Colors.black54, fontSize: 23),
                        )),
                     SizedBox(height: mqh *0.01,),
                     Divider(
                      color: Colors.black.withOpacity(0.1),
                    ),
                    Container(
                      width: mqw ,
                      height: mqh * 0.25,
                      child: Card(
                        // margin: const EdgeInsets.all(10),
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.all(13),
                            child: Text(product.details!,textAlign: TextAlign.justify,style: TextStyle(color: Colors.black54 ),)),
                      ),
                    ),
                    SizedBox(height: 20,),
                     SizedBox(
          width: double.infinity,
          child: Container(
            padding:  EdgeInsets.only(left: mqw * 0.03,right: mqw * 0.03),
            child: RaisedButton(
              padding: const EdgeInsetsDirectional.all(15),

              onPressed: () {
                // getImageFileFromAssets(product.image.toString());
                // addImage();
                // FirebaseFireStoreHelper.fireStoreHelper.addCart(Product(image: product.image, title: product.title, id: product.id, price: product.price,));
                         Navigator.push(context, MaterialPageRoute(builder: (context) =>
                             Cart(data: product, id : product.id) ));
                ToastMessage.showToast( "The product has been added successfully", true);
              },

              color: const Color.fromRGBO(106, 144, 242, 1),
              textColor: Colors.white70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child:  const Text(
                "ADD TO CART",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  fontFamily: "Tajawal",
                  color: Colors.white,
                ),
              ),

            ),
          ),
        )
                  ],
                ),
              )
            ],
          ),
        ));



  }

  void addImage()async{
    var storge = FirebaseStorage.instance;
    String imageName = product.image!.substring(product.image!.lastIndexOf("/"),product.image!.lastIndexOf("."));
    String path = product.image!.substring(product.image!.indexOf("/")+1,product.image!.lastIndexOf("/"));
    final Directory systemTempDir = Directory.systemTemp;
    final byteData = await rootBundle.load(product.image.toString());
    final file = File('${systemTempDir.path}/$imageName.jpg');
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes,byteData.lengthInBytes));
    TaskSnapshot taskSnapshot= await storge.ref('$path/$imageName').putFile(file);
    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    await FirebaseFirestore.instance.collection(path).add({"url":downloadUrl,"name":imageName});

  }


  // Future<File> getImageFileFromAssets(String path) async {
  //   final byteData = await rootBundle.load(path);
  //
  //   final file = File('${(await getTemporaryDirectory()).path} /$path');
  //   print(File);
  //   await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  //   Reference ref = FirebaseStorage.instance.ref()
  //       .child("profileImage_${product.id}");
  //   await ref.putFile(File(file.path));
  //   return file;
  // }
}
