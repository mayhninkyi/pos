import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/controller/home_controller.dart';
import 'package:pos/core/util/media_query_extension.dart';

import '../../../core/constant/colors.dart';
import '../../../core/global/custom_image.dart';
import '../../../core/util/app_styles.dart';

class ProductItem extends StatelessWidget {
  final HomeController controller;
  final int index;
  const ProductItem({super.key, required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final product = controller.productList[index];
      return GestureDetector(
        onTap: () {
          product.count++;
          controller.addProduct(product);
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageWidget(
                    radius: 20,
                    imageUrl: product.image,
                    width: double.infinity,
                    height: context.screenHeight * 0.2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      product.productName,
                      maxLines: 1,
                      style: black14TextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "${getPriceFormat(product.price)} kyats",
                      maxLines: 1,
                      style: black16TextStyle,
                    ),
                  ),
                ],
              ),
            ),
            controller.productList[index].count == 0
                ? Container()
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 15,
                          child: Text(product.count.toString())),
                    ),
                  ),
          ],
        ),
      );
    });
  }
}
