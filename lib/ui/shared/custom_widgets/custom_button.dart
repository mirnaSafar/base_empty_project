import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/ui/shared/extensions.dart';
import 'package:sizer/sizer.dart';

import '../colors.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final double? height;

  final double? fontsize;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  // final Function? onPressed;
  final void Function()? onPressed;
  final String? imageName;
  final bool? loader;
  const CustomButton({
    super.key,
    this.text,
    this.color = const Color.fromRGBO(45, 36, 100, 1),
    this.textColor,
    this.borderColor,
    this.onPressed,
    this.imageName,
    this.loader = false,
    this.fontsize,
    this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Sizer(builder: (context, orientation, deviceType) {
      if (loader!) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SpinKitCircle(
            color: color ?? AppColors.buttonColor,
          ),
        );
      } else {
        return ElevatedButton(
            onPressed: () {
              onPressed!();
            },
            style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  size.width,
                  height ?? 16.w,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                backgroundColor: color,
                side: borderColor != null
                    ? BorderSide(
                        width: 1,
                        color: borderColor!,
                      )
                    : null),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (imageName != null) ...[
                  SvgPicture.asset('assets/images/$imageName.svg'),
                  10.w.px,
                ],
                text != null
                    ? Text(
                        text!,
                        style: TextStyle(
                            color: textColor ?? AppColors.mainWhiteColor,
                            fontSize: fontsize ?? 27),
                      )
                    : child!,
              ],
            ));
      }
    });
  }
}
