import 'package:flutter/material.dart';
import 'package:pos/core/constant/colors.dart';
import 'package:intl/intl.dart';

Widget kDivider() => Container(
      color: const Color(0xFFCECCCC).withOpacity(0.5),
      width: double.infinity,
      height: 1,
    );

Widget kVerticalSpace(double height) => SizedBox(
      height: height,
    );

Widget kHorizontalSpace(double width) => SizedBox(
      width: width,
    );

const white14TextStyle = TextStyle(
    fontSize: 14, color: whiteColor, height: 1.4, fontWeight: FontWeight.w700);

const black14TextStyle = TextStyle(
    fontSize: 14, color: blackColor, height: 1.4, fontWeight: FontWeight.w700);
const black16TextStyle = TextStyle(
    fontSize: 16, color: blackColor, height: 1.4, fontWeight: FontWeight.w700);
const black22TextStyle = TextStyle(
    fontSize: 22, color: blackColor, height: 1.4, fontWeight: FontWeight.w700);

String getPriceFormat(int points) {
  var f = NumberFormat("###,###", "en_US");
  return f.format(points);
}

String getDate(String createdAt) {
  DateTime createDate = DateFormat('yyyy-MM-dd hh:mm:ss').parse(createdAt);
  String dt = DateFormat('MMM dd, yyyy  EEEE').format(createDate);
  return dt;
}

String getTime(String createdAt) {
  String dt = DateFormat('hh:mm a').format(DateTime.parse(createdAt));
  return dt;
}
