import 'package:flutter/material.dart';

import '../../../core/enums/bottom_Navigation.dart';
import '../../../core/services/base_controller.dart';

class MainViewController extends BaseController {
  BottomNavigationEnum selected = BottomNavigationEnum.HOME;
  PageController pageController = PageController(initialPage: 2);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void setSelectedEnum(BottomNavigationEnum selectedEnum) {
    selected = selectedEnum;
  }
}
