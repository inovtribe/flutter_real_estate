import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:real_estate/text_styles/Introduction.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final imagePath = "assets/images/";
  final pages = const [
    {
      "title": "Explore",
      "body":
          "Explore real estate in your neighboarhood or accross the world in real time",
      "imageName": "intro_explore.svg",
    },
    {
      "title": "Be a Buyer",
      "body":
          "When you type the website name on your address bar, a simple yet classy homepage of the website",
      "imageName": "intro_buyer.svg",
    },
    {
      "title": "Be a Seller",
      "body":
          "Did you read the DaVinci Code or maybe see the movie? Did it get you interested in history and secret codes?",
      "imageName": "intro_seller.svg",
    },
    {
      "title": "Neighboardhood Influancer",
      "body": "Gain followers, likes and rise a neighboarhood influancer.",
      "imageName": "intro_neighboardhood_influancer.svg",
    },
    {
      "title": "Message",
      "body": "Follow, like or direct message post that spark your interest.",
      "imageName": "intro_message.svg",
    },
  ];

  Widget _buildImage(String imageName) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width / 5),
      child: SvgPicture.asset(
        imagePath + imageName,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Text(
      text,
      style: introTitleStyle,
    );
  }

  Widget _buildBody(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        style: introBodyStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IntroductionScreen(
        key: introKey,
        pages: pages
            .map((p) => PageViewModel(
                  titleWidget: _buildTitle(p["title"]),
                  bodyWidget: _buildBody(p["body"]),
                  image: _buildImage(p["imageName"]),
                ))
            .toList(),
        onDone: () {},
        done: const Text(
          'SIGN IN',
          style: buttonText,
        ),
        next: const Text(
          'NEXT',
          style: buttonText,
        ),
        dotsFlex: 2,
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
