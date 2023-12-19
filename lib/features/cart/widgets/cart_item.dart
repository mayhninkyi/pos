import 'package:flutter/material.dart';
import 'package:pos/core/constant/colors.dart';
import 'package:pos/core/controller/home_controller.dart';
import 'package:pos/core/global/custom_image.dart';
import 'package:pos/core/model/product_model.dart';
import 'package:pos/core/util/app_styles.dart';
import 'package:pos/core/util/media_query_extension.dart';

class CartItem extends StatefulWidget {
  final ProductModel model;
  final HomeController controller;
  const CartItem({super.key, required this.model, required this.controller});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(20)),
      child: Row(children: [
        CustomImageWidget(
            imageUrl: widget.model.image,
            width: context.screenWidth * 0.2,
            height: context.screenWidth * 0.2,
            radius: 0),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.model.productName,
                style: black14TextStyle,
              ),
              Text(
                "${getPriceFormat(widget.model.price)} kyats",
                style: black16TextStyle,
              ),
              kVerticalSpace(12),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (widget.model.count > 1) {
                        widget.model.count--;
                        widget.controller.addProduct(widget.model);
                        setState(() {});
                      }
                    },
                    child: const CircleAvatar(
                      radius: 15,
                      child: Center(
                        child: Icon(Icons.remove),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(widget.model.count.toString()),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.model.count++;
                      widget.controller.addProduct(widget.model);
                      setState(() {});
                    },
                    child: const CircleAvatar(
                      radius: 15,
                      child: Center(
                        child: Icon(Icons.add),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          width: 2,
          height: context.screenWidth * 0.2,
          color: Colors.grey,
        ),
        SizedBox(
          width: context.screenWidth * 0.15,
          child: Center(
              child: IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              widget.controller.removeProduct(widget.model);
            },
          )),
        )
      ]),
    );
  }
}
