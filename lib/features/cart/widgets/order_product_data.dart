import 'package:flutter/material.dart';

import '../../../core/util/app_styles.dart';

class OrderProductData extends StatelessWidget {
  final String productName;
  final String price;
  final String qty;
  const OrderProductData({
    super.key,
    required this.productName,
    required this.price,
    required this.qty,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              productName,
              style: black16TextStyle,
            ),
          ),
          Expanded(
            child: Text(
              qty,
              style: black16TextStyle,
            ),
          ),
          Text(
            price,
            style: black16TextStyle,
          ),
        ],
      ),
    );
  }
}
