import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/constant/colors.dart';

import 'package:pos/core/controller/home_controller.dart';
import 'package:pos/core/util/media_query_extension.dart';
import 'package:pos/features/dashboard/widgets/product_list_item.dart';

class DashboardPage extends StatelessWidget {
  final HomeController controller;
  const DashboardPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: const EdgeInsets.all(12),
      child: Obx(() {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            mainAxisExtent: context.screenHeight * 0.27,
          ),
          itemCount: controller.productList.length,
          itemBuilder: (ctx, index) {
            return ProductItem(
              controller: controller,
              index: index,
            );
          },
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
        );
      }),
    );
  }
}
