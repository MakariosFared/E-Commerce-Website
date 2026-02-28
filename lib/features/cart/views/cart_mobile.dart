import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../home/views/widgets/footer_section.dart';
import '../widgets/cart_item_tile.dart';
import '../widgets/order_summary_section.dart';

class CartMobile extends StatelessWidget {
  const CartMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const CartItemTile(
                    title: 'Apple iPhone 14 Pro Max 128Gb Deep Purple',
                    variant: 'Deep Purple',
                    sku: '#25139526913984',
                    price: '\$1399',
                    imagePath:
                        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-14-pro-finish-unselect-gallery-1-202209_GEO_US?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1660754254474',
                  ),
                  const Divider(height: 32),
                  const CartItemTile(
                    title: 'AirPods Max Silver',
                    variant: 'Silver',
                    sku: '#53459359345',
                    price: '\$549',
                    imagePath:
                        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airpods-max-select-silver-202011?wid=470&hei=556&fmt=png-alpha&.v=1604021221000',
                  ),
                  const Divider(height: 32),
                  const CartItemTile(
                    title: 'Apple Watch Series 9 GPS 41mm Starlight Aluminium',
                    variant: 'Starlight',
                    sku: '#63862324',
                    price: '\$399',
                    imagePath:
                        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MT9N3ref_VW_34FR+watch-41-alum-starlight-nc-9s_VW_34FR_WF_CO?wid=750&hei=712&trim=1%2C0&fmt=p-jpg&qlt=95&.v=1694507905569',
                  ),
                  const SizedBox(height: 48),
                  const OrderSummarySection(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
