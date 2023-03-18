import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:momma/modle/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../modle/users.dart';

class FirebaseFireStoreHelper {
  FirebaseFireStoreHelper._();
  static FirebaseFireStoreHelper fireStoreHelper = FirebaseFireStoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String userCollection = "Users";

  Future SaveUserData(Users users, String id) async {
    await firestore.collection(userCollection).doc(id).set({
      "id": id,
      "email": users.email,
      "firstName": users.firstName,
      "lastName": users.lastName,
      "phone": users.phone,
      "imageUrl":users.image,
    });
  }

  Future addCart(Product product) async {
    await firestore.collection("Cart").doc(FirebaseAuth.instance.currentUser!.uid).set({
      "id": product.id,
      "title": product.title,
      "image": product.image,
      "price": product.price,
    });
  }


}