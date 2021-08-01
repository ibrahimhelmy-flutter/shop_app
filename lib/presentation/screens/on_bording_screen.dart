import 'package:flutter/material.dart';
import 'package:shop_app/data/models/boardig_model.dart';
import 'package:shop_app/presentation/screens/login_screen.dart';
import 'package:shop_app/presentation/widgets/build_onBoarding_item.dart';
import 'package:shop_app/shared/cashe_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String id = "/";

  // const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();
  bool isLast = false;

  void Submite() {
    CacheHelper.saveData(key: "board", value: true).then((value) {
    if(value){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => LoginScreen()));
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [TextButton(onPressed: Submite, child: Text("Skip"))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                physics: BouncingScrollPhysics(),
                onPageChanged: (index) {
                  if (index == BoardingModel.boarders.length - 1) {
                    print("Last");
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    print("Not Last");
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) {
                  return BuildOnBoardingItem(
                      context: context, model: BoardingModel.boarders[index]);
                },
                itemCount: 3,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: pageController,
                    effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        expansionFactor: 3,
                        dotWidth: 10,
                        spacing: 5.0,
                        activeDotColor: Theme.of(context).accentColor),
                    count: BoardingModel.boarders.length),
                Spacer(),
                TextButton(
                    onPressed: () {
                      if (isLast) {
                        Submite();
                      } else {
                        pageController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: Text(isLast ? "Finish" : "Next")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
