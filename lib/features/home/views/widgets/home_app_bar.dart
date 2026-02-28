import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'cyber',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: -1,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.person_outline, color: Colors.black),
          onPressed: () => context.pushNamed('login'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
