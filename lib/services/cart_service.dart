import 'package:ecommerce/model/model.dart';

class CartService {
  static final List<Product> _cartItems = [];

  static void addToCart(Product product) {
    _cartItems.add(product);
  }

  static List<Product> getCartItems() => _cartItems;

  static void removeFromCart(Product product) {
    _cartItems.remove(product);
  }

  static void clearCart() {
    _cartItems.clear();
  }
}