import 'package:flutter/material.dart';

class Product {
  final String ? image;
  final String? title;
  final int ?price;
  final int? id;
  final String? details;
  int ?countItem;

  Product(
      { this.image,
       this.title,
       this.id,
       this.price,
       this.details,
       this.countItem});

  static List<Product> listProducts = [
    Product(
        image: "assets/images/product.jpg",
        title: "HandBags",
        id: 1,
        countItem: 1,
        price: 10,
        details:
            " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book. "),
    Product(
        image: "assets/images/cat2.jpg",
        title: "HandBags",
        id: 2,
        countItem: 1,
        price: 20,
        details:
            " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book. "),
    Product(
        image: "assets/images/Clip.jpg",
        title: "HandBags",
        id: 3,
        countItem: 1,
        price: 50,
        details:
            " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book. "),
    Product(
        image: "assets/images/Img.jpg",
        title: "HandBags",
        id: 4,
        countItem: 1,
        price: 30,
        details:
            " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book. "),
    Product(
        image: "assets/images/product.jpg",
        title: "HandBags",
        id: 5,
        countItem: 1,
        price: 45,
        details:
            " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book. "),
    Product(
        image: "assets/images/cat2.jpg",
        title: "HandBags",
        id: 6,
        countItem: 1,
        price: 80,
        details:
            " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book. "),
    Product(
        image: "assets/images/Clip.jpg",
        title: "HandBags",
        id: 7,
        countItem: 1,
        price: 60,
        details:
            " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book. "),
    Product(
        image: "assets/images/Img.jpg",
        title: "HandBags",
        id: 8,
        countItem: 1,
        price: 70,
        details:
            " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book. "),
  ];
}
