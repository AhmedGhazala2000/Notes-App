import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key, required this.hintText, this.maxLines = 1, this.onSaved, this.onChange})
      : super(key: key);
  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field is required';
        }
        return null;
      },
      onSaved: onSaved,
      onChanged: onChange,
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        border: customBorder(),
        enabledBorder: customBorder(),
        focusedBorder: customBorder(color: kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder customBorder({color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
