import 'package:flutter/material.dart';
import 'package:momma/view/screen/cart.dart';
import 'package:momma/modle/product.dart';

import '../screen/more/more.dart';
import '../screen/home/homePage.dart';

class TabScreen extends StatefulWidget {
  static const routePage= '/TapScreen';

  final data;
  final id;
  TabScreen({this.data,this.id});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  late List<Map<String, Object>> pages;
  int selectedPageIndex = 0;

  @override

  void initState() {
    pages = [
      {'pages': HomePage(),},
      {'pages':Cart() },
      {'pages': More(data: widget.data,id: widget.id) },
    ];
    super.initState();
  }

  void selectedPage(int value) {
    setState(() {
      selectedPageIndex = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPageIndex]['pages'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedPage,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 30,), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,size: 30,), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.more_vert_rounded,size: 30,), label: "More"),

        ],
      ),
    );
  }
}
