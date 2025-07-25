import 'dart:async';
import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/services/dio.dart';
import 'package:ecommerce/view/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/view/widgets/appbar.dart';
import 'package:ecommerce/view/widgets/bottonbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int imageIndex = 0;
  late Timer _timer;
  final List<String> _images = [
    'assets/b1.jpg',
    'assets/b2.jpg',
    'assets/b3.jpg',
    'assets/b4.jpg',
  
  ];

  List<CategoryModel> categories = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        setState(() {
          imageIndex = (imageIndex + 1) % _images.length;
        });
      }
    });

    loadCategories();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  Future<void> loadCategories() async {
    try {
      final result = await getCategories();

       print('API Response: $result');

      if (result != null && result.isNotEmpty) {
        setState(() {
          categories = result.map((name) => CategoryModel(name: name)).toList();
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'No categories found or empty response';
        });
      }
    } catch (e) {
      print('Error loading categories: $e');
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load categories: ${e.toString()}';
      });
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 52, 82),
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 150,
              child: _images.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        _images[imageIndex],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(Icons.broken_image),
                            ),
                          );
                        },
                      ),
                    )
                  : Container(
                      color: Colors.grey[300],
                      child: const Center(child: Text("No images available")),
                    ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Product Categories',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
                 fontWeight: FontWeight.bold
                 ),
            ),

            const SizedBox(height: 10),

            if (isLoading)
              const Expanded(child: Center(child: CircularProgressIndicator()))

            else if (errorMessage.isNotEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              )
            else if (categories.isEmpty)
              const Expanded(
                child: Center(
                  child: Text(
                    'No categories available',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            else
              Expanded(
                child: RefreshIndicator(
                  onRefresh: loadCategories,
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(  ), 
                    itemCount: categories.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3 / 2,
                    ),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return  GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CategoryProductsPage(
                                categoryName: category.name,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          color: const Color.fromARGB(255, 62, 105, 110),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                category.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color:Color.fromARGB(255, 255, 255, 255),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
      
      bottomNavigationBar: const CustomButtonBar(),
      
    );
  }
}
