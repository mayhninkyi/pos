import 'package:flutter/material.dart';
import 'package:pos/core/constant/colors.dart';
import 'package:pos/core/controller/home_controller.dart';
import 'package:pos/core/util/app_styles.dart';
import 'package:pos/features/history/widgets/history_item.dart';

class HistoryPage extends StatelessWidget {
  final HomeController controller;
  const HistoryPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: const EdgeInsets.all(12.0),
      child: controller.recordList.isEmpty
          ? const Center(
              child: Text(
                "Empty",
                style: black16TextStyle,
              ),
            )
          : ListView.builder(
              itemCount: controller.recordList.length,
              itemBuilder: (ctx, index) {
                return HistoryItem(
                  model: controller.recordList[index],
                );
              },
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
            ),
    );
  }
}
