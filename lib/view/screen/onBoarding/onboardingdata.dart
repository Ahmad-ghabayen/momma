import 'package:flutter/material.dart';

class OnBordingData extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;

  const OnBordingData(
      {required this.title, required this.subTitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 11,left: 11),
      child: Column(
        children: [
          const Spacer(),
          Image.asset(image),
          const Spacer(),
          Text(title,
              style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(
            subTitle,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 18.5,color: Colors.grey),
          ),
        ],
      ),
    );
  }
}