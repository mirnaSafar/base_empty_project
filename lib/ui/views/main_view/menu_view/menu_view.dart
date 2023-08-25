import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/core/data/models/menu_data.dart';
import 'package:flutter_templete/ui/shared/extensions.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:flutter_templete/ui/views/order_details/order_details.dart';
import 'package:get/get.dart';

import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_text.dart';
import '../../../shared/utils.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  void initState() {
    super.initState();
    _menuData.addAll(menuData.where((element) {
      return element['image'] != null && element['category'] != null;
    }));
  }

  List<Map<String, dynamic>> _menuData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.off(MainView(),
                                duration: Duration(seconds: 1),
                                transition: Transition.leftToRight);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 11),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: AppColors.mainWhiteColor,
                                    width: 1.5)),
                            child: SvgPicture.asset(
                              'assets/images/back_arrow.svg',
                              width: 15,
                              height: 15,
                            ),
                          ),
                        ),
                        15.px,
                        CustomText(
                          text: 'MENU',
                          fontSize: 17,
                          textColor: AppColors.mainWhiteColor,
                          bold: true,
                        ),
                      ],
                    ),
                    3.ph,
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                              'assets/images/Icon ionic-md-notifications.svg'),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: AppColors.mainWhiteColor, width: 1.5)),
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
                40.ph,
                Expanded(
                  // height: screenHeight(8),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _menuData.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return 20.px;
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: AppColors.categryBackgroundColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: screenWidth(4),
                              height: screenHeight(11),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://backend.thebhive.io/${_menuData[index]['image']}',
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.info),
                                ),
                              )
                              // Image.network(
                              //     ),
                              ),
                          10.ph,
                          SizedBox(
                            width: 97,
                            child: CustomText(
                              text: '${_menuData[index]['name']}',
                              textColor: Colors.white,
                              fontSize: 11,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight(3)),
          child: Container(
            height: screenHeight(1),
            width: screenWidth(1),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                )),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    30.ph,
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenHeight(40)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Recommended',
                            textColor: AppColors.mainBlueColor,
                            bold: true,
                            fontSize: 20,
                          ),
                          20.ph,
                          SizedBox(
                            height: screenHeight(4.5),
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: _menuData.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return 15.px;
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(
                                        OrderDetailsView(
                                          order: _menuData[index],
                                        ),
                                        duration: Duration(seconds: 1),
                                        transition: Transition.rightToLeft);
                                  },
                                  child: Column(
                                    // mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                            color: AppColors
                                                .categryBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          width: screenWidth(2.6),
                                          height: 105,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  'https://backend.thebhive.io/${_menuData[index]['image']}',
                                              fit: BoxFit.cover,
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.info),
                                            ),
                                          )),
                                      10.ph,
                                      SizedBox(
                                        width: screenWidth(2.6),
                                        child: CustomText(
                                          textAlign: TextAlign.start,
                                          text: '${_menuData[index]['name']}',
                                          textColor: AppColors.mainBlueColor,
                                          fontSize: 17,
                                        ),
                                      ),
                                      5.ph,
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Positioned(
                                            top: 0,
                                            right: -4,
                                            child: CustomText(
                                                bold: true,
                                                text: '\$',
                                                textColor: AppColors.priceColor,
                                                fontSize: 8),
                                          ),
                                          CustomText(
                                            textAlign: TextAlign.start,
                                            text:
                                                '${_menuData[index]['price']}',
                                            textColor: AppColors.priceColor,
                                            fontSize: 14,
                                            bold: true,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenHeight(40)),
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _menuData
                            .where((element) => element['category'] != null)
                            .length,
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            height: 50,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: '${_menuData[index]['category']}',
                                bold: true,
                                fontSize: 20,
                                textColor: AppColors.mainBlueColor,
                              ),
                              20.ph,
                              ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _menuData
                                    .where((element) =>
                                        element['category'] ==
                                        _menuData[index]['category'])
                                    .length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return 20.ph;
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () => Get.to(
                                        OrderDetailsView(
                                          order: _menuData[index],
                                        ),
                                        duration: Duration(seconds: 1),
                                        transition: Transition.rightToLeft),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            10.ph,
                                            SizedBox(
                                              width: screenWidth(2.6),
                                              child: CustomText(
                                                textAlign: TextAlign.start,
                                                text:
                                                    '${_menuData[index]['name']}',
                                                textColor:
                                                    AppColors.mainBlueColor,
                                                fontSize: 17,
                                              ),
                                            ),
                                            5.ph,
                                            Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Positioned(
                                                  top: 0,
                                                  right: -4,
                                                  child: CustomText(
                                                      bold: true,
                                                      text: '\$',
                                                      textColor:
                                                          AppColors.priceColor,
                                                      fontSize: 8),
                                                ),
                                                CustomText(
                                                  textAlign: TextAlign.start,
                                                  text:
                                                      '${_menuData[index]['price']}',
                                                  textColor:
                                                      AppColors.priceColor,
                                                  fontSize: 14,
                                                  bold: true,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 112,
                                          height: 80,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  'https://backend.thebhive.io/${_menuData[index]['image']}',
                                              fit: BoxFit.cover,
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.info),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ]),
            ),
          ),
        )
      ]),
    );
  }
}
