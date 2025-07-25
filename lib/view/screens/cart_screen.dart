import 'package:ecommerce/states/app_state.dart';
import 'package:ecommerce/view/widgets/bottonbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/model/realm_model.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);
    final realm = ref.read(realmProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: cart.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final product = cart[index];
                return ListTile(
                  leading: Image.network(product.thumbnail),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                   onPressed: () {
                    cartNotifier.removeFromCart(product.id);

                  realm.write(() {
                  final productToDelete = realm.find<RealmProduct>(product.id);
                   if (productToDelete != null) {
                   realm.delete(productToDelete);
                      }
                      });
                      },
                  ),
                );
              },
            ),
      bottomNavigationBar:  CustomButtonBar(),
    );
  }
}