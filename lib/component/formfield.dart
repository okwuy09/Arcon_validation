import 'package:arcon_app/component/colors.dart';
import 'package:arcon_app/component/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class TextFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final Widget? suffixIcon;
  bool obscureText;
  TextFormWidget({
    super.key,
    required this.controller,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.autofillHints,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      style: style.copyWith(
        fontWeight: FontWeight.w500,
      ),
      inputFormatters: inputFormatters,
      autofillHints: autofillHints,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.lightBlack),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.red),
        ),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
