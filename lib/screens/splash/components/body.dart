import 'package:flutter/material.dart';
import 'package:cake_app/constants.dart';
import 'package:cake_app/screens/sign_in/sign_in_screen.dart';
import 'package:cake_app/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/kue 1.png",
      "text": "Lorem ipsum dolor sit amet \nconsectetur adipiscing elit. \nImperdiet elit massa arcu \nmauris facilisis mattis",
      
    },
    {
      "image": "assets/images/kue 2.png",
      "text":
          "Lorem ipsum dolor sit amet \nconsectetur adipiscing elit. \nImperdiet elit massa arcu \nmauris facilisis mattis",
      
    },
    {
      "image": "assets/images/kue 3.png",
      "text": "Lorem ipsum dolor sit amet \nconsectetur adipiscing elit. \nImperdiet elit massa arcu \nmauris facilisis mattis",
      
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Let's Get Started",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(flex: 4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 12,
      width: currentPage == index ? 12 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
