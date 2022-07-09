import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  double index = 0.0;
  List<Image> imagesList = [
    Image.asset(
      'assets/images/1.png',
      height: 250.0,
      width: double.infinity,
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/2.png',
      height: 250.0,
      width: double.infinity,
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/3.png',
      height: 314.0,
      width: double.infinity,
      fit: BoxFit.cover,
    ),
  ];
  List<Text> mainText = [
        const Text(
          "Get food delivery to your doorstep asap",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          "Buy any food from your favourite restaurant",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          "Into your home",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
          ),
        ),
  ],
      subText = [
        const Text(
          "We have young and professional delivery team that will bring your food as soon as possible to your doorstep",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          "We are constantly adding your favourite restaurant throughout the territory and around your area carefully selected",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          "We deliver anywhere to reach your home ",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 0.0,
        backgroundColor: Colors.white,
        /*
        * all of the widgets in actions and leading will have the same height of appbar but width is
        * flexible.
        * to fix the height i could use padding or
        * wrap appbar with preferedsize (to add specific height and width
        * and these new sizes will be applied to the widget added in flexiblespace parameter
        * Appbar will keep its height because it's must have the same height (logically)
        * */
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              width: 70.0,
              decoration: BoxDecoration(
                color: const Color(0xFFFAF2E7),
                borderRadius: BorderRadius.circular(22.0),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '7',
                    style: TextStyle(
                      color: Color(0xFFE6C59A),
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Krave',
                    style: TextStyle(
                      color: Color(0xFF03AEA6),
                      fontSize: 32.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              imagesList[index.toInt()],
              const SizedBox(
                height: 15.0,
              ),
              mainText[index.toInt()],
              const SizedBox(
                height: 10.0,
              ),
              subText[index.toInt()],
              const SizedBox(
                height: 10.0,
              ),
              DotsIndicator(
                dotsCount: imagesList.length,
                position: index,
                decorator: DotsDecorator(
                  color: Colors.grey.withOpacity(0.4),
                  spacing: const EdgeInsets.symmetric(
                    horizontal: 3.0,
                    vertical: 8.0,
                  ),
                  activeColor: Color(0xFFE6BC85),
                  activeSize: const Size(18.0, 6.0),
                  size: const Size(18.0, 6.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                onTap: (pos) {
                  setState(() {
                    index = pos;
                  });
                  debugPrint("pressed");
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 50.0,
                color: const Color(0xFF51AFAB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  debugPrint("get started");
                },
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      debugPrint("sign up");
                    },
                    child: const Text(
                      "Sign Up ",
                      style: TextStyle(
                        color: const Color(0xFF6AB8B3),
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
