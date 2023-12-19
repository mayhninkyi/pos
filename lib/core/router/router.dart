import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/core/model/product_model.dart';
import 'package:pos/features/cart/checkout_page.dart';
import 'package:pos/features/cart/print_page.dart';
import 'package:pos/features/home/home_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/checkout',
      builder: (BuildContext context, GoRouterState state) {
        return CheckoutPage();
      },
    ),
    GoRoute(
      path: '/printPage',
      builder: (BuildContext context, GoRouterState state) {
        List<ProductModel> data = state.extra as List<ProductModel>;
        return PrintPage(
          data: data,
        );
      },
    ),
  ],
);
