import 'package:ecommerce/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomButtonBar extends ConsumerWidget {
  const CustomButtonBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartCount = ref.watch(cartProvider).length;

    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
          icon: Badge(
            label: Text('$cartCount'),
            child: const Icon(Icons.shopping_cart),
          ),
          label: 'Cart',
        ),
      ],
      onTap: (index) {
        if (index == 0) Navigator.pushNamed(context, '/home');
        if (index == 1) Navigator.pushNamed(context, '/search');
        if (index == 2) Navigator.pushNamed(context, '/cart');
      },
    );
  }
}