import 'package:flutter/material.dart';
import 'package:note_app/utils/responsive_font_size.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key, required this.text, required this.icon, this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      minimum: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: getResponsiveFontSize(context, fontSize: 28),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(.05),
            ),
            child: IconButton(
              icon: Icon(
                icon,
                size: getResponsiveFontSize(context, fontSize: 24),
              ),
              onPressed: onPressed ?? () {},
            ),
          )
        ],
      ),
    );
  }
}
