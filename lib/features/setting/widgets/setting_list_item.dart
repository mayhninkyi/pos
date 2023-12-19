import 'package:flutter/material.dart';
import 'package:pos/core/constant/colors.dart';

import '../../../core/util/app_styles.dart';

class SettingListItem extends StatelessWidget {
  final String label;
  const SettingListItem({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kHorizontalSpace(12),
        const Icon(Icons.home),
        kHorizontalSpace(12),
        Text(
          label,
          style: black16TextStyle,
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: primaryColor,
            ))
      ],
    );
  }
}
