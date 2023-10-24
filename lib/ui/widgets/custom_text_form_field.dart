import 'package:flutter/material.dart';
import 'package:store/common/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.title = '',
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.suffixIcon,
  });

  final String title;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController controller;

  final Icon? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: regular,
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            onChanged: onChanged,
            obscureText: obscureText,
            controller: controller,
            validator: validator,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
                borderSide: BorderSide(color: kInactiveColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              suffixIcon: suffixIcon,
              // suffixIconColor: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
