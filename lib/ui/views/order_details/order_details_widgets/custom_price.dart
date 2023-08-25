import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_text.dart';

class CustomPrice extends StatelessWidget {
  const CustomPrice({
    super.key,
    required this.price,
    this.color,
    this.bold = true,
    this.pricesize,
    this.dollarsize,
    this.textAlign,
  });

  final String price;

  final TextAlign? textAlign;
  final Color? color;
  final bool? bold;
  final double? pricesize;
  final double? dollarsize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 0,
          right: -7,
          child: CustomText(
            bold: true,
            text: '\$',
            textColor: color ?? AppColors.priceColor,
            fontSize: dollarsize ?? 12,
          ),
        ),
        CustomText(
          textAlign: textAlign ?? TextAlign.start,
          text: price,
          textColor: color ?? AppColors.priceColor,
          fontSize: pricesize ?? 20,
          bold: bold ?? true,
        ),
      ],
    );
  }
}
