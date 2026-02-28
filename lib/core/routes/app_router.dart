import 'package:e_commerce/features/cart/views/cart_screen.dart';
import 'package:e_commerce/features/home/views/home_screen.dart';
import 'package:e_commerce/features/product_details/views/product_details_screen.dart';
import 'package:e_commerce/features/checkout/views/checkout_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/product-details',
      name: 'product_details',
      builder: (context, state) => const ProductDetailsScreen(),
    ),
    GoRoute(
      path: '/cart',
      name: 'cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/checkout',
      name: 'checkout',
      builder: (context, state) => const CheckoutScreen(),
    ),
  ],
);
