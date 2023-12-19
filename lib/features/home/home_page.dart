import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/constant/colors.dart';
import 'package:pos/features/cart/cart_page.dart';
import 'package:pos/features/dashboard/dashboard_page.dart';
import 'package:pos/features/history/history_page.dart';
import 'package:pos/features/setting/setting_page.dart';

import '../../core/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POS"),
        centerTitle: true,
        backgroundColor: primaryColor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.qr_code_scanner,
                color: whiteColor,
              ))
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.compact,
              hoverColor: secondaryColor,
              selectedHoverColor: secondaryColor,
              selectedColor: primaryColor,
              selectedTitleTextStyle: const TextStyle(color: whiteColor),
              selectedIconColor: whiteColor,
            ),
            items: [
              SideMenuItem(
                title: 'Dashboard',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.home),
              ),
              SideMenuItem(
                title: 'Cart',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.shopping_cart),
                badgeContent: Obx(() {
                  return Text(
                    "${controller.selectedProductList.length}",
                    style: const TextStyle(color: whiteColor),
                  );
                }),
              ),
              SideMenuItem(
                title: 'History',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.blinds_closed),
              ),
              SideMenuItem(
                title: 'Setting',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.settings),
              ),
              SideMenuItem(
                title: 'Exit',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                DashboardPage(
                  controller: controller,
                ),
                CartPage(
                  controller: controller,
                ),
                HistoryPage(controller: controller),
                const SettingPage(),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
