import 'package:realm/realm.dart';

part 'realm_model.realm.dart'; // مهم جدًا لتوليد الكود تلقائيًا

@RealmModel()
class _RealmProduct {
  @PrimaryKey()
  late int id;

  late String title;
  late double price;
  late String thumbnail;
  late String category;
}