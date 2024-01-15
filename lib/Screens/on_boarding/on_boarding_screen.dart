import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_app_flutter/Screens/Home/homeScreen.dart';
import 'package:store_app_flutter/Screens/on_boarding/model.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({
    super.key,
  });

  static String id = 'onBoardingScreen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController();

  List<OnBoardingModel> onboardinglist = [
    OnBoardingModel(
        image: 'assets/images/delivery.png',
        title: 'BASSEL && Store',
        body: ' نورت بيتك يا حبيييبي '),
    OnBoardingModel(
        image: 'assets/images/friendship.png',
        title: 'تعالى نشوف كده ',
        body: 'اسعارنا غالية اووي منصحكش تجرب '),
    OnBoardingModel(
        image: 'assets/images/done.png',
        title: 'يلا بينا ؟؟',
        body: 'Welcome To Bassel Store نورت بيتك يا حبيييبي'),
  ];

  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
          actions: [
            Text('مرحبا بك'),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                  child: PageView.builder(
                      onPageChanged: (int index) {
                        if (index == onboardinglist.length - 1) {
                          setState(() {
                            isLast = true;
                          });
                          print(isLast);
                        } else {
                          setState(() {
                            isLast = false;
                          });
                        }
                      },
                      physics: BouncingScrollPhysics(),
                      controller: pageController,
                      itemCount: onboardinglist.length,
                      itemBuilder: (context, index) =>
                          BoardingItem(model: onboardinglist[index]))),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                      effect: ExpandingDotsEffect(
                          dotColor: Colors.grey, spacing: 5),
                      controller: pageController,
                      count: onboardinglist.length),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.bounceInOut);
                      if (isLast) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue,
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class BoardingItem extends StatelessWidget {
  BoardingItem({super.key, required this.model});

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(model.image)),
        Text(
          model.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          model.body,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        )
      ],
    );
  }
}
