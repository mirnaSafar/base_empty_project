import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/core/data/models/product_model.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/user_input.dart';
import 'package:flutter_templete/ui/shared/extensions.dart';
import 'package:flutter_templete/ui/views/main_view/menu_view/menu_view.dart';
import 'package:flutter_templete/ui/views/order_details/order_details_controllrer.dart';
import 'package:flutter_templete/ui/views/order_details/order_details_widgets/custom_price.dart';
import 'package:flutter_templete/ui/views/order_details/order_details_widgets/custom_radio_list.dart';
import 'package:get/get.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_text.dart';
import '../../shared/utils.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({super.key, required this.order});
  final Map<String, dynamic> order;
  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  Widget build(BuildContext context) {
    OrderDetailsController controller = Get.put(OrderDetailsController(
      ProductModel.fromJson(widget.order),
    ));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: screenHeight(2.4),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              AppColors.gradientBlueColor,
              AppColors.gradientPurpleColor,
              AppColors.mainPurpleColor,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Column(
              children: [
                30.ph,
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(15), vertical: screenHeight(40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.off(MenuView(),
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
                            text: 'Customize your order',
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
                                    color: AppColors.mainWhiteColor,
                                    width: 1.5)),
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
                Expanded(
                  child: Image.network(
                    'https://backend.thebhive.io/${widget.order['image']}',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight(2.4)),
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth(15),
                            vertical: screenHeight(40)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              // width: screenWidth(2.6),
                              child: CustomText(
                                text: '${widget.order['name']}',
                                bold: true,
                                fontSize: 20,
                                textColor: AppColors.mainBlueColor,
                              ),
                            ),
                            5.ph,
                            CustomPrice(price: '${widget.order['price']}')
                          ],
                        ),
                      ),
                      // 30.ph,
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth(15),
                        ),
                        child: Obx(() {
                          print(controller.selectedValue.value);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 10.0, bottom: 0),
                                child: CustomText(
                                  text: 'Choose Milk',
                                  bold: true,
                                  fontSize: 17,
                                  textColor: AppColors.mainBlueColor,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: 0,
                                    groupValue: controller.selectedValue.value,
                                    onChanged: (value) {
                                      controller.selectedValue.value =
                                          value ?? -1;
                                    },
                                    visualDensity: VisualDensity(
                                        horizontal: 0, vertical: 0),
                                    activeColor: AppColors.radioBackgroundColor,
                                  ),
                                  CustomText(
                                    text: 'Skimmed Milk',
                                    textColor: AppColors.mainBlueColor,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Radio(
                                    value: 1,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    groupValue: controller.selectedValue.value,
                                    onChanged: (value) {
                                      controller.selectedValue.value =
                                          value ?? -1;
                                    },
                                    visualDensity: VisualDensity(
                                        horizontal: 0, vertical: 0),
                                    activeColor: AppColors.radioBackgroundColor,
                                  ),
                                  CustomText(
                                    text: 'Full Fat Milk',
                                    textColor: AppColors.mainBlueColor,
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                      ),
                      Divider(),
                      Obx(
                        () => Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 10.0, bottom: 0, top: 20),
                                child: CustomText(
                                  text: 'Add Extra Ingredients',
                                  bold: true,
                                  fontSize: 17,
                                  textColor: AppColors.mainBlueColor,
                                ),
                              ),
                              CustomRadioList(
                                  model: ProductModel.fromJson(widget.order),
                                  value: 0,
                                  groupValue: controller
                                      .selectedIntegredientValue.value,
                                  text: 'Whipped Cream',
                                  dollarsize: 7,
                                  pricesize: 14,
                                  priceIsBold: false,
                                  price: '1.00'),
                              CustomRadioList(
                                value: 1,
                                groupValue:
                                    controller.selectedIntegredientValue.value,
                                text: 'Vanilla flavor',
                                dollarsize: 7,
                                pricesize: 14,
                                priceIsBold: false,
                                price: '1.25',
                                model: ProductModel.fromJson(widget.order),
                              ),
                              CustomRadioList(
                                  model: ProductModel.fromJson(widget.order),
                                  value: 2,
                                  groupValue: controller
                                      .selectedIntegredientValue.value,
                                  text: 'Carmel Flavor',
                                  dollarsize: 7,
                                  pricesize: 14,
                                  priceIsBold: false,
                                  price: '1.40'),
                              CustomRadioList(
                                  model: ProductModel.fromJson(widget.order),
                                  value: 3,
                                  groupValue: controller
                                      .selectedIntegredientValue.value,
                                  text: 'Mocha flavor',
                                  dollarsize: 7,
                                  pricesize: 14,
                                  priceIsBold: false,
                                  price: '1.00'),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 10.0, bottom: 0, top: 20),
                              child: CustomText(
                                text: 'Any Special Request',
                                bold: true,
                                fontSize: 17,
                                textColor: AppColors.mainBlueColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 10.0, bottom: screenHeight(4), top: 0),
                              child: UserInput(text: 'Tell us here'),
                            )
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.mainWhiteColor,
                boxShadow: [
                  BoxShadow(color: AppColors.greyColor, blurRadius: 16)
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.changeCount(false);
                              controller
                                  .calcTotal(
                                      ProductModel.fromJson(widget.order))
                                  .toString();
                            },
                            child: CustomText(
                                fontSize: 17,
                                bold: true,
                                textColor: AppColors.mainBlackColor,
                                text: '-'),
                          ),
                          CustomText(
                              fontSize: 17,
                              bold: true,
                              textColor: AppColors.mainBlackColor,
                              text: controller.count.toString()),
                          InkWell(
                            onTap: () {
                              controller.changeCount(true);
                              controller
                                  .calcTotal(
                                      ProductModel.fromJson(widget.order))
                                  .toString();
                            },
                            child: CustomText(
                                bold: true,
                                fontSize: 17,
                                textColor: AppColors.mainBlackColor,
                                text: '+'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: 1),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: CustomButton(
                        height: screenHeight(20),
                        child: Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: CustomText(
                                    textColor: AppColors.mainWhiteColor,
                                    fontSize: 14,
                                    text: '${controller.count.value} item',
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Flexible(
                                  // alignment: Alignment.center,
                                  child: CustomText(
                                    textAlign: TextAlign.center,
                                    textColor: AppColors.mainWhiteColor,
                                    fontSize: 17,
                                    text: 'Add to Cart',
                                  ),
                                ),
                                Flexible(
                                  child: CustomPrice(
                                    color: AppColors.mainWhiteColor,
                                    pricesize: 14,
                                    price: controller.total.value
                                        .toStringAsFixed(2),
                                  ),
                                )
                              ]),
                        ),
                        color: AppColors.radioBackgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
