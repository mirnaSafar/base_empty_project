import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/views/main_view/menu_view/menu_view.dart';

import '../../../core/enums/bottom_Navigation.dart';
import '../../shared/colors.dart';
import '../../shared/utils.dart';
import 'home_view/home_view.dart';
import 'main_view_widgets/bottom_navigation_widget.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  BottomNavigationEnum selected = BottomNavigationEnum.HOME;
  PageController pageController = PageController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // MainViewController controller = Get.put(MainViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.mainBlackColor,
      key: scaffoldKey,
      endDrawer: Container(
        color: AppColors.mainWhiteColor,
        width: screenWidth(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('option 1'),
            Text('option 2'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        bottomNavigationEnum: selected,
        onTap: (selectedEnum, pageNumber) {
          // scaffoldKey.currentState!.openDrawer();
          pageController.animateToPage(pageNumber,
              duration: const Duration(
                milliseconds: 100,
              ),
              curve: Curves.linear);
          setState(() {
            selected = selectedEnum;
          });
        },
      ),

      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        // scrollBehavior: ScrollBehavior(),
        onPageChanged: (pageNumer) {},
        children: const [
          // ProductsView(),
          HomeView(),
          MenuView(),
          // CartView(),
        ],
      ),
    );
  }
}
