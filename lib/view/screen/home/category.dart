import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Kinsa",
    " Womens",
    "Handbags",
    "  Boots ",
    "  Mens",
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final mqh= MediaQuery.of(context).size.height;

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: mqh* 0.025),
      child: SizedBox(
        height: mqh * 0.03,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return buildcategories(index);
            }),
      ),
    );
  }

  Widget buildcategories(int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex=index;
        });
      },
      child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width *0.04  ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                categories[index],
                style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selectedIndex==index? Colors.blue: Colors.black ),
              ),
              Container(
                margin:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.001),
                width: MediaQuery.of(context).size.width * 0.14,
                height: 2,
                color: selectedIndex == index ? Colors.blue : Colors.transparent,
              )
            ],
          )),
    );
  }
}
