import 'package:ecommerce/model/model.dart';

class FavoriteService {
  static final List<Product> _favoriteItems = [];

  static void addToFavorites(Product product) {
    _favoriteItems.add(product);
  }

  static List<Product> getFavoriteItems() => _favoriteItems;

  static void removeFromFavorites(Product product) {
    _favoriteItems.remove(product);
  }

  static void clearFavorites() {
    _favoriteItems.clear();
  }
}