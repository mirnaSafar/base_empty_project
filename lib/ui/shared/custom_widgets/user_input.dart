import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class UserInput extends StatefulWidget {
  UserInput(
      {super.key,
      required this.text,
      this.controller,
      this.validator,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixIcon});
  bool? obscureText;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final String text;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Sizer(
      builder: (context, orientation, deviceType) => Padding(
        padding: EdgeInsets.only(top: height * 0.03),
        child: TextFormField(
          obscureText: widget.obscureText!,
          autovalidateMode: AutovalidateMode.always,
          validator: widget.validator,
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: widget.obscureText!
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.obscureText = !widget.obscureText!;
                      });
                    },
                    icon: Icon(widget.obscureText!
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                  )
                : widget.suffixIcon,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.w),
            hintText: widget.text,
            prefixIcon: widget.prefixIcon,
            hintStyle: const TextStyle(
              color: Color.fromRGBO(182, 183, 183, 1),
            ),
            // filled: true,
            // fillColor: const Color.fromRGBO(242, 242, 242, 1),
            border: OutlineInputBorder(borderSide: BorderSide()
                // borderRadius: BorderRadius.circular(30),
                ),
          ),
        ),
      ),
    );
  }
}
