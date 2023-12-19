import 'package:flutter/material.dart';
import 'package:pos/core/util/app_styles.dart';
import 'package:pos/core/util/media_query_extension.dart';

import '../constant/colors.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final IconData icon;
  const CustomIconButton(
      {super.key,
      required this.onTap,
      required this.label,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(12),
          height: context.screenHeight * 0.07,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: whiteColor, width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    icon,
                    color: whiteColor,
                  )),
              Text(
                label,
                style: white14TextStyle,
              ),
            ],
          )),
    );
  }
}
