// dio.dart (لا تغيير هنا، إنها تعمل بشكل صحيح)
import 'package:dio/dio.dart';

final Dio dio = Dio();
const String categoryUrl = 'https://dummyjson.com/products/category-list';

Future<List<String>?> getCategories() async {
  try {
    final response = await dio.get(categoryUrl);
    if (response.statusCode == 200) {
      return List<String>.from(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print('API Error: $e');
    return null;
  }
}

const String productUrl = 'https://dummyjson.com/products';
const String searchUrl = 'https://dummyjson.com/products/search?q=phone';