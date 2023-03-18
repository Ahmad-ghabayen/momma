import 'package:flutter/material.dart';
import 'package:momma/view/widget/defaultBotton.dart';

import '../authentication/sign_in.dart';
import 'onboardingdata.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController pageController = PageController();


  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> dataScreen = [
      {
        'title':"Welcome!",
        'subTitle': "Now were up in the big leagues getting our turn at bat. The Brady Bunch that's the way we  Brady Bunch.",
        'image': 'images/screen1.jpg'
      },
      {
        'title': "Add to cart",
        'subTitle':
        "Now were up in the big leagues gettingour turn at bat. The Brady Bunch that's the way we  Brady Bunch.",
        'image': 'images/screen2.jpg'
      },
      {
        'title': "Enjoy Purchase!",
        'subTitle':
        "Now were up in the big leagues gettingour turn at bat. The Brady Bunch that's the way we  Brady Bunch.",
        'image': 'images/screen3.jpg'
      },
    ];
    final mq = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: mq.height *0.03,),
            if (currentPage != 2) Align(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                onPressed: () {
                  pageController.jumpToPage(2);
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontSize: 25,
                  ),
                ),
              ),
            ) ,

            Expanded(
                flex: 4,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: dataScreen.length,
                  itemBuilder: (BuildContext context, int index) =>
                      OnBordingData(
                    title: dataScreen[index]['title'].toString(),
                    subTitle: dataScreen[index]['subTitle'].toString(),
                    image: dataScreen[index]['image'].toString(),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          dataScreen.length, (index) => buildDot(index)),
                    ),
                     SizedBox(height: MediaQuery.of(context).size.height *0.06,),
                    if (currentPage == 2) Container(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.008 ),
                        height: MediaQuery.of(context).size.height * 0.078,
                        child: DefaultBotton(title: 'Start',routPage:SignIn.routName )),
                  Spacer(),
                  ],
                )),
          ],
        ),
      ),
    ));
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin:  EdgeInsets.only(right: 10, top: MediaQuery.of(context).size.height * 0.04),
      height: MediaQuery.of(context).size.height *0.008,
      width:  MediaQuery.of(context).size.width *0.065,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
