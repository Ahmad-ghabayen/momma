import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  List image = [
    "assets/images/cat2.jpg",
    "assets/images/Clip.jpg",
    "assets/images/Img.jpg"
  ];
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    final mqh= MediaQuery.of(context).size.height;
    final mqw= MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: mqh * 0.01),
      child: SizedBox(
        height: mqh * 0.28,
        child: ListView(
          children: [
            Container(
              height: mqh * 0.255,
              child: CarouselSlider(
                items: image.map((imageUrl) {
                  return Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.fill,
                      width: mqw*  0.7,
                      height: mqh * 0.2,
                     // color: Colors.grey.withOpacity(0.2),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    initialPage: 0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentImage = index;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: mqh * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(image.length, (index) => buildDot(index)),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: const EdgeInsets.only(right: 10),
      height: 6,
      width: currentImage == index ? 25 : 6,
      decoration: BoxDecoration(
        color: currentImage == index ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
