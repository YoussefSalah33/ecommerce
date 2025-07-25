import 'package:ecommerce/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomButtonBar extends ConsumerWidget {
  const CustomButtonBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartCount = ref.watch(cartProvider).length;

    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 16, 78, 129),

       selectedItemColor: const Color.fromARGB(255, 0, 0, 0),     
       unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),  

      items: [
        const BottomNavigationBarItem(
          
          icon: Icon(
            Icons.home,
          
            ),
             label: 'Home' ,
             ),
        const BottomNavigationBarItem(icon: Icon(Icons.favorite,), label: 'favourite'),
        BottomNavigationBarItem(
          icon: const Icon(Icons.shopping_cart,),
          label: 'Cart',
        ),
      ],
      
      onTap: (index) {
        if (index == 0) Navigator.pushNamed(context, '/home');
        if (index == 1) Navigator.pushNamed(context, '/favouritepage');
        if (index == 2) Navigator.pushNamed(context, '/cartpage');
      },
    );
  }
}