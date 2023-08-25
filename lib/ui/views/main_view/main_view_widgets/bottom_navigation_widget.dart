import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_controller.dart';
import 'package:get/get.dart';

import '../../../../core/enums/bottom_Navigation.dart';
import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_text.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum bottomNavigationEnum;
  final Function(BottomNavigationEnum, int) onTap;

  const BottomNavigationWidget(
      {Key? key, required this.bottomNavigationEnum, required this.onTap})
      : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    MainViewController controller = Get.put(MainViewController());
    final size = MediaQuery.of(context).size;
    return Stack(
        // fit: StackFit.loose,
        alignment: Alignment.center,
        children: [
          Container(
            width: size.width,
            height: size.height * 0.12,
            color: AppColors.mainWhiteColor,
          ),
          Positioned(
            // bottom: size.height * 0.00,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  navItem(
                      imageName: 'Icon open-home',
                      text: 'HOME',
                      isSelected: widget.bottomNavigationEnum ==
                          BottomNavigationEnum.HOME,
                      onTap: () {
                        widget.onTap(BottomNavigationEnum.HOME, 0);
                      },
                      size: size),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      navItem(
                          imageName: 'Icon material-shopping-cart',
                          text: 'MY CART',
                          isSelected: widget.bottomNavigationEnum ==
                              BottomNavigationEnum.MYCART,
                          onTap: () {
                            widget.onTap(BottomNavigationEnum.MYCART, 1);
                          },
                          size: size),
                      Visibility(
                        visible: controller.notificationCounter.value != 0,
                        child: Positioned(
                          bottom: 24,
                          right: -3,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: AppColors.mainRedColor,
                            child: Obx(
                              () => CustomText(
                                text: '6',
                                textColor: AppColors.mainWhiteColor,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  navItem(
                      imageName: 'Group 208',
                      text: 'MY POINT',
                      isSelected: widget.bottomNavigationEnum ==
                          BottomNavigationEnum.MYPOINTS,
                      onTap: () {
                        widget.onTap(BottomNavigationEnum.MYPOINTS, 2);
                      },
                      size: size),
                  navItem(
                      imageName: 'Icon material-event',
                      text: 'EVENTS',
                      isSelected: widget.bottomNavigationEnum ==
                          BottomNavigationEnum.EVENTS,
                      onTap: () {
                        widget.onTap(BottomNavigationEnum.EVENTS, 3);
                      },
                      size: size),
                  SizedBox(
                    width: size.width * 0.15,
                    child: InkWell(
                      onTap: () {
                        widget.onTap(BottomNavigationEnum.NFT, 4);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: widget.bottomNavigationEnum ==
                                      BottomNavigationEnum.NFT
                                  ? AppColors.mainBlueColor
                                  : AppColors.mainGreyColor,
                            ),
                            // padding: EdgeInsets.symmetric(
                            //     horizontal: screenWidth(50)),
                            child: SvgPicture.asset(
                              // alignment: Alignment.center,
                              fit: BoxFit.scaleDown,
                              'assets/images/NFT.svg',
                              color: AppColors.mainWhiteColor,
                              // width: size.width * 0.09,
                              height: size.width * 0.075,
                            ),
                          ),
                          5.ph,
                          SizedBox(
                            height: size.width * 0.02,
                          ),
                          CustomText(
                            text: 'NFT',
                            fontSize: size.width * 0.03,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]);
  }

  Widget navItem({
    required String imageName,
    required String text,
    required bool isSelected,
    required Function() onTap,
    required Size size,
  }) {
    return SizedBox(
      width: size.width * 0.15,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/$imageName.svg',
              color: isSelected
                  ? AppColors.mainBlueColor
                  : AppColors.mainGreyColor,
              // width: size.width * 0.09,
              height: size.width * 0.075,
            ),
            5.ph,
            SizedBox(
              height: size.width * 0.02,
            ),
            CustomText(
              text: text,
              fontSize: size.width * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
