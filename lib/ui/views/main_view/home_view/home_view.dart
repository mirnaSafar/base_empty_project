import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/menu_view/menu_view.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<String> imgList = [
    'assets/images/MOBILE APP BANNER copy 2@3x.png',
    'assets/images/MOBILE APP BANNER copy 2@3x.png',
    'assets/images/MOBILE APP BANNER copy 2@3x.png',
  ];
  List<List<String>> searchList = [
    ['MENU', 'assets/images/Icon simple-buymeacoffee.svg'],
    ['MERCHANDISE', 'assets/images/Icon ionic-ios-shirt.svg'],
    ['BOOK YOUR SPACE', 'assets/images/space.svg'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // fit: StackFit.expand,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: screenHeight(2),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              AppColors.gradientBlueColor,
              AppColors.gradientPurpleColor,
              AppColors.mainPurpleColor,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(15), vertical: screenHeight(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Hello Name',
                        fontSize: 20,
                        textColor: AppColors.mainWhiteColor,
                        bold: true,
                      ),
                      3.ph,
                      Row(
                        children: [
                          CustomText(
                            text: 'B1  34, 846 PTS',
                            textColor: AppColors.orangeColor,
                            fontSize: 12,
                          ),
                          10.px,
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                                'assets/images/Icon ionic-ios-arrow-back.svg'),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                            'assets/images/Icon ionic-md-notifications.svg'),
                      ),
                      // CustomPaint(
                      //   foregroundPainter: new MyPainter(
                      //       lineColor: Colors.white,
                      //       completeColor: AppColors.orangeColor,
                      //       completePercent: 65,
                      //       width: 2.0),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: Colors.transparent, width: 1.5),
                            gradient: LinearGradient(
                                colors: [
                                  AppColors.orangeColor,
                                  AppColors.mainWhiteColor,
                                ],
                                begin: Alignment.topCenter,
                                tileMode: TileMode.clamp,
                                stops: [0, 0],
                                end: Alignment(-5, -4))),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColors.mainPurpleColor,
                          child: CircleAvatar(
                              radius: 18,
                              backgroundColor: AppColors.mainWhiteColor,
                              child: SvgPicture.asset(
                                'assets/images/ic_user_login.svg',
                                height: screenHeight(50),
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight(7)),
            child: Container(
              height: screenHeight(1),
              width: screenWidth(1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13),
                    topRight: Radius.circular(13),
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenHeight(40)),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        30.ph,
                        CarouselSlider.builder(
                          carouselController: _controller,
                          options: CarouselOptions(
                              autoPlay: false,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.6,
                              aspectRatio: 1.5,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            return Transform.scale(
                              scale: 1.2,
                              child: Image.asset(
                                imgList[index],
                                fit: BoxFit.cover,
                                width: screenWidth(1),
                              ),
                            );
                          },
                          itemCount: imgList.length,
                        ),
                        30.ph,
                        Center(child: indicatorBuilder()),
                        30.ph,
                        CustomText(
                          text: 'What are you Looking for?',
                          textColor: AppColors.mainBlueColor,
                          bold: true,
                          fontSize: 20,
                        ),
                        30.ph,
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1.2,
                          ),
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                index == 0
                                    ? Get.to(MenuView(),
                                        transition: Transition.rightToLeft,
                                        duration: Duration(seconds: 4))
                                    : null;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.mainPurpleColor),
                                width: screenWidth(2),
                                height: screenHeight(30),
                                child: Column(
                                  // mainAxisSize: ma,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    20.ph,
                                    SvgPicture.asset(searchList[index][1]),
                                    20.ph,
                                    CustomText(
                                      text: searchList[index][0],
                                      fontSize: 11,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        10.ph,
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight(30)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.mainPurpleColor),
                            width: screenWidth(1),
                            // height: screenHeight(30),
                            child: Column(
                              // mainAxisSize: ma,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                20.ph,
                                SvgPicture.asset(searchList[2][1]),
                                20.ph,
                                CustomText(
                                  text: searchList[2][0],
                                  fontSize: 11,
                                ),
                              ],
                            ),
                          ),
                        ),
                        30.ph,
                      ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  AnimatedSmoothIndicator indicatorBuilder() {
    return AnimatedSmoothIndicator(
        effect: WormEffect(
            spacing: 5,
            dotWidth: 9,
            dotHeight: 10,
            dotColor: AppColors.unactiveDotIndicatorColor,
            activeDotColor: AppColors.activeDotIndicatorColor),
        activeIndex: _current,
        count: imgList.length);
  }
}

class MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  MyPainter(
      {required this.lineColor,
      required this.completeColor,
      required this.completePercent,
      required this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
    double arcAngle = 2 * pi * (completePercent / 100);
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
