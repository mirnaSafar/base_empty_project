import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering_application/core/enums/bottom_navigation.dart';
import 'package:food_ordering_application/ui/shared/custom_widgets/custom_text.dart';
import 'package:food_ordering_application/ui/shared/utils.dart';
import 'package:food_ordering_application/ui/views/main_view/main_view_widgets/bottom_nav_clipper.dart';
import 'package:get/get.dart';

import '../../../shared/colors.dart';

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
    final size = MediaQuery.of(context).size;
    double cpWidth = 500;
    return Stack(
        // fit: StackFit.loose,
        alignment: Alignment.bottomCenter,
        children: [
          CustomPaint(
            painter: BottomNavShadowPainter(
                shadow: Shadow(blurRadius: 12, color: AppColors.mainTextColor),
                clipper: BottomNavClipper()),
            child: ClipPath(
              clipper: BottomNavClipper(),
              child: Container(
                width: size.width,
                height: size.height * 0.09,
                color: AppColors.mainWhiteColor,
              ),
            ),
          ),
          // Padding(
          //     padding: EdgeInsets.only(bottom: 0.04 * size.height),
          //     child: InkWell(
          //       onTap: () {
          //         widget.onTap(BottomNavigationEnum.HOME, 1);
          //       },
          //       child: CircleAvatar(
          //         backgroundColor:
          //             widget.bottomNavigationEnum == BottomNavigationEnum.HOME
          //                 ? AppColors.mainBlueColor
          //                 : AppColors.mainTextColor,
          //         radius: size.width * 0.085,
          //         child: SvgPicture.asset('assets/images/home-svgrepo-com.svg',
          //             color: AppColors.mainWhiteColor
          //             // : AppColors.mainWhiteColor,
          //             ),
          //       ),
          //     )),
          Positioned(
            bottom: size.height * 0.00,
            left: 20,
            right: 20,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  navItem(
                      imageName: 'products-svgrepo-com',
                      text: ' ',
                      isSelected: widget.bottomNavigationEnum ==
                          BottomNavigationEnum.PRODUCTS,
                      onTap: () {
                        widget.onTap(BottomNavigationEnum.PRODUCTS, 0);
                      },
                      size: size),
                  navItem(
                      imageName: 'home-svgrepo-com',
                      text: ' ',
                      isSelected: widget.bottomNavigationEnum ==
                          BottomNavigationEnum.HOME,
                      onTap: () {
                        widget.onTap(BottomNavigationEnum.HOME, 1);
                      },
                      size: size),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      navItem(
                          imageName: 'cart-svgrepo-com',
                          text: ' ',
                          isSelected: widget.bottomNavigationEnum ==
                              BottomNavigationEnum.CART,
                          onTap: () {
                            widget.onTap(BottomNavigationEnum.CART, 2);
                          },
                          size: size),
                      Positioned(
                        bottom: 24,
                        right: -3,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: AppColors.mainRedColor,
                          child: Obx(
                            () => CustomText(
                              text: cartService.cartCount.toString(),
                              textColor: AppColors.mainWhiteColor,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
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
    return InkWell(
      onTap: onTap,
      // () {
      //   onTap();
      // },
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/images/$imageName.svg',
            color:
                isSelected ? AppColors.mainBlueColor : AppColors.mainBlackColor,
            // width: size.width * 0.09,
            height: size.width * 0.08,
          ),
          SizedBox(
            height: size.width * 0.02,
          ),
          Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? AppColors.mainBlueColor
                  : AppColors.mainTextColor,
            ),
          )
        ],
      ),
    );
  }
}
