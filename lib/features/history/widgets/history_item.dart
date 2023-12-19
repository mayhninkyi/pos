import 'package:flutter/material.dart';
import 'package:pos/core/constant/colors.dart';
import 'package:pos/core/model/record.dart';
import 'package:pos/core/util/app_styles.dart';
import 'package:pos/core/util/media_query_extension.dart';

class HistoryItem extends StatelessWidget {
  final RecordModel model;
  const HistoryItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: context.screenHeight * 0.1,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          kHorizontalSpace(12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getDate(model.date),
                style: black14TextStyle,
              ),
              Text(
                getTime(model.date),
                style: black14TextStyle,
              ),
            ],
          ),
          const Spacer(),
          Text(
            getPriceFormat(model.total),
            style: black16TextStyle,
          ),
          kHorizontalSpace(12)
        ],
      ),
    );
  }
}
