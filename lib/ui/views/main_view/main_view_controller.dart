import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/enums/bottom_Navigation.dart';
import '../../../core/services/base_controller.dart';
import '../../shared/utils.dart';

class MainViewController extends BaseController {
  Rx<BottomNavigationEnum> selected = BottomNavigationEnum.HOME.obs;
  PageController pageController = PageController(initialPage: 1);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxInt notificationCounter = 0.obs;

  void setSelectedEnum(BottomNavigationEnum selectedEnum) {
    selected.value = selectedEnum;
  }

  changeNotificationCounter() {
    notificationService.notifcationStream.stream
        .asBroadcastStream()
        .listen((event) {
      notificationCounter.value += 1;
    });
  }
}
