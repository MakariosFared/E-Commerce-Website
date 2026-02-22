import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';


class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('App Name'),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.backgroundDark,
        child: Builder(
          builder: (drawerContext) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}

