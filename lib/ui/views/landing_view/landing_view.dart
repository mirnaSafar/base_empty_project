import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';

import '../../shared/colors.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Opacity(
          opacity: 0.65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: 'BEIRUT',
                onPressed: () {
                  context.push(MainView());
                },
              ),
              10.ph,
              CustomButton(
                text: 'DUBAI',
                onPressed: () {
                  context.push(MainView());
                },
              ),
            ],
          ),
        ),
      ),
    )));
  }
}
