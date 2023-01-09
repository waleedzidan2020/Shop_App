import 'package:flutter/material.dart';
import 'package:my_app/modules/Shop_App/shop_login/Shop_LogIn.dart';
import 'package:my_app/shared/components/components.dart';
import 'package:my_app/shared/network/local/cashe_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingModel {
  final String? imageurl;
  final String? ScreenTitle;
  final String? ScreenBody;

  OnBoardingModel({
    this.imageurl,
    this.ScreenTitle,
    this.ScreenBody,
  });
}

class onboarding_screen extends StatefulWidget {
  @override
  State<onboarding_screen> createState() => _onboarding_screenState();
}

class _onboarding_screenState extends State<onboarding_screen> {
  bool IsLast = false;
  List<OnBoardingModel> ListOfModel = [
    OnBoardingModel(
        imageurl: "images/slide-1.png",
        ScreenBody: "Screen Title1",
        ScreenTitle: "1"),
    OnBoardingModel(
        imageurl: "images/slide-2.png",
        ScreenBody: "Screen Title2",
        ScreenTitle: "2"),
    OnBoardingModel(
        imageurl: "images/slide-3.png",
        ScreenBody: "Screen Title3",
        ScreenTitle: "3"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var BoardController = PageController();

  void submit() {
    CacheHelper.SaveData("Onboarding", true).then((value) {
      if (value) {
        NaviatAndPush(context, ShopLogInScreen());
        print(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                submit();
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 20,
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: BoardController,
                physics: BouncingScrollPhysics(),
                onPageChanged: (index) {
                  index == ListOfModel.length - 1
                      ? IsLast = true
                      : IsLast = false;
                },
                itemBuilder: (context, index) {
                  return OnBoardinItem(ListOfModel[index]);
                },
                itemCount: ListOfModel.length,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: BoardController,
                  count: ListOfModel.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.blue,
                    spacing: 5.0,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (IsLast) {
                      submit();
                    } else {
                      BoardController.nextPage(
                        duration: Duration(
                          milliseconds: 120,
                        ),
                        curve: standardEasing,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget OnBoardinItem(OnBoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Image(
              image: AssetImage("${model.imageurl}"),
              width: double.infinity,
              height: 200,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "${model.ScreenBody}",
            style: TextStyle(
              fontSize: 24,
              fontFamily: "Oswald",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "${model.ScreenTitle}",
            style: TextStyle(fontSize: 16),
          ),
        ],
      );
}
