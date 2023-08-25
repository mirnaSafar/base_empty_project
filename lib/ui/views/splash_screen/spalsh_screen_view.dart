import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/views/landing_view/landing_view.dart';
import 'package:flutter_templete/ui/views/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

//alt+shift+o
class SplashSceenView extends StatefulWidget {
  const SplashSceenView({super.key});
  @override
  State<SplashSceenView> createState() => _SplashSceenViewState();
}

class _SplashSceenViewState extends State<SplashSceenView> {
  SplashSceenController controller = Get.put(SplashSceenController());
  //lazyput
  //putasync
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 7), () {
      // After a delay, navigate to the main screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LandingView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [AppColors.gradientBlueColor, AppColors.mainPurpleColor],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      // curve: Curves.easeInOut,
      // duration: Duration(seconds: 1),
      alignment: Alignment.center,
      child: Animate(
          effects: [
            FadeEffect(duration: Duration(seconds: 1)),
            SlideEffect(
              duration: Duration(seconds: 5),
              begin: Offset(0, 1),
              end: Offset(0, 0),
            )
          ],
          child: SvgPicture.asset(
            'assets/images/Group 23.svg',
            // animation: "fly",
          )
          // .animate()
          // .fadeIn(
          //   delay: 1000.ms,
          // )
          // .slide(),
          ),
    )));
  }
}

// top:size.hiegh*0.7

    //          Stack(
    //   alignment: Alignment.bottomCenter,
    //   fit: StackFit.passthrough,
    //   children: [
    //     SvgPicture.asset(
    //       'assets/images/bg_background.svg',
    //       height: screenHeight(1),
    //       width: screenWidth(1),
    //     ),
    //     Center(
    //         child: SvgPicture.asset(
    //       'assets/images/Logo.svg',
    //       width: screenWidth(5),
    //       height: screenHeight(5),
    //     )),
    //     Container(
    //       margin: EdgeInsets.only(bottom: screenWidth(3)),
    //       // width: size.width*0.1,
    //       height: screenWidth(3),
    //       child: SpinKitThreeBounce(
    //         color: AppColors.mainOrangeColor,
    //       ),
    //     ),
    //   ],
    // )