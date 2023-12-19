import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/core/constant/colors.dart';
import 'package:pos/core/controller/home_controller.dart';
import 'package:pos/core/util/app_styles.dart';
import 'package:pos/core/util/media_query_extension.dart';
import 'package:pos/features/cart/widgets/order_product_data.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({super.key});
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: const Text(
            "Checkout",
            style: TextStyle(color: whiteColor, fontSize: 22),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kVerticalSpace(12),
                      const Center(
                        child: Text(
                          "*****Thank You*****",
                          style: black22TextStyle,
                        ),
                      ),
                      kVerticalSpace(20),
                      const OrderProductData(
                          productName: "Product Name",
                          price: "Price",
                          qty: "Qty"),
                      ListView.builder(
                          itemCount: controller.selectedProductList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final productModel =
                                controller.selectedProductList[index];
                            return OrderProductData(
                              productName: productModel.productName,
                              price: getPriceFormat(productModel.price),
                              qty: "x ${productModel.count}",
                            );
                          }),
                      kVerticalSpace(12),
                      Container(
                        width: context.screenWidth,
                        height: 2,
                        color: Colors.grey,
                      ),
                      kVerticalSpace(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: black16TextStyle,
                          ),
                          const Spacer(),
                          Text(
                            getPriceFormat(controller.total.value),
                            style: black16TextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  controller.addRecord();
                  var snackBar = const SnackBar(
                      content: Text(
                          'Checkout successfully! Please Check in History'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  context.pushReplacement("/printPage",
                      extra: controller.selectedProductList);
                },
                child: Container(
                  height: context.screenHeight * 0.05,
                  width: double.infinity,
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      "Print Out",
                      style: white14TextStyle,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
