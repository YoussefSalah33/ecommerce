import 'package:ecommerce/states/app_state.dart';
import 'package:ecommerce/view/screens/cart_screen.dart';
import 'package:ecommerce/view/screens/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/view/screens/home.dart';
import 'package:ecommerce/model/realm_model.dart';
import 'package:realm/realm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة Realm
  final config = Configuration.local(
    [RealmProduct.schema],
    schemaVersion: 1,
  );
  final realm = Realm(config);

  runApp(
    ProviderScope(
      overrides: [
        realmProvider.overrideWithValue(realm),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       routes: {
    '/home': (context) => const HomeScreen(),
    '/favouritepage':(context) => const FavoritesPage(),
    '/cartpage' :(context) => const CartPage(),
    
  },
      theme: ThemeData(useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}