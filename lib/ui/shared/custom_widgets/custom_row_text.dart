import 'package:flutter/material.dart';

import '../colors.dart';
import 'custom_text.dart';

class CustomRowText extends StatelessWidget {
  const CustomRowText(
      {super.key, required this.firstText, required this.linkText, this.onTap});

  final String firstText, linkText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(text: firstText),
        InkWell(
          child: CustomText(
            text: linkText,
            textColor: AppColors.mainOrangeColor,
            bold: true,
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
