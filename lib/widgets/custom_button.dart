import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/utils/responsive_font_size.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, required this.onPressed, this.isLoading = false})
      : super(key: key);
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      minWidth: MediaQuery.of(context).size.width,
      color: kPrimaryColor,
      height: 50,
      onPressed: onPressed,
      child: isLoading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: Colors.black87,
              ),
            )
          : Text(
              'Add',
              style: TextStyle(
                color: Colors.black,
                fontSize: getResponsiveFontSize(context, fontSize: 18),
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
