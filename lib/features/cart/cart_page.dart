import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/constant/colors.dart';
import 'package:pos/core/controller/home_controller.dart';
import 'package:pos/core/global/custom_button_with_icon.dart';
import 'package:pos/core/router/router.dart';
import 'package:pos/core/util/app_styles.dart';
import 'package:pos/core/util/media_query_extension.dart';
import 'package:pos/features/cart/widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  final HomeController controller;
  const CartPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        color: Colors.grey[300],
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 12,
                  bottom: context.screenWidth * 0.135,
                  right: 12,
                  left: 12),
              child: controller.selectedProductList.isEmpty
                  ? const Center(
                      child: Text(
                        "Empty Cart",
                        style: black16TextStyle,
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.selectedProductList.length,
                      itemBuilder: (ctx, index) {
                        return CartItem(
                          model: controller.selectedProductList[index],
                          controller: controller,
                        );
                      },
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                    ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: whiteColor,
                height: context.screenHeight * 0.1,
                child: Row(
                  children: [
                    const Text(
                      "Total -",
                      style: black14TextStyle,
                    ),
                    Text(
                      getPriceFormat(controller.total.value),
                      style: black16TextStyle,
                    ),
                    const Spacer(),
                    CustomIconButton(
                      onTap: () {
                        router.push("/checkout");
                      },
                      label: "CHECKOUT",
                      icon: Icons.shopping_cart_checkout_sharp,
                    ),
                    kHorizontalSpace(12)
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
