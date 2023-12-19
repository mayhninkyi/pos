import 'package:flutter/material.dart';
import 'package:pos/core/util/media_query_extension.dart';

import '../../core/constant/colors.dart';
import '../../core/global/custom_image.dart';
import '../../core/util/app_styles.dart';
import 'widgets/setting_list_item.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                CustomImageWidget(
                    imageUrl:
                        "https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/profile-photos-4.jpg",
                    width: context.screenHeight * 0.15,
                    height: context.screenHeight * 0.15,
                    radius: 10),
                kHorizontalSpace(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Name",
                              maxLines: 1,
                              style: black14TextStyle,
                            ),
                          ),
                          Icon(Icons.edit),
                        ],
                      ),
                      const Text(
                        "Number ********6841",
                        style: black14TextStyle,
                      ),
                      const Text(
                        "example@gmail.com",
                        style: black14TextStyle,
                      ),
                      kVerticalSpace(12),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFEEEEEE),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Column(
              children: [
                const SettingListItem(
                  label: "Address",
                ),
                kDivider(),
                const SettingListItem(
                  label: "Loem",
                ),
                kDivider(),
                const SettingListItem(
                  label: "Loem",
                ),
                kDivider(),
                const SettingListItem(
                  label: "Loem",
                ),
                kDivider(),
              ],
            ),
          ),
          kVerticalSpace(30),
        ],
      ),
    );
  }
}
