import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isActive, required this.color})
      : super(key: key);
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: isActive
          ? CircleAvatar(
              backgroundColor: Colors.white,
              radius: 37,
              child: CircleAvatar(
                backgroundColor: color,
                radius: 34,
              ),
            )
          : CircleAvatar(
              backgroundColor: color,
              radius: 37,
            ),
    );
  }
}
