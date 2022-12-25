import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/widgets/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Categories"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8.4,
          ),

          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return const CategoryWidget();
          },
        ),
      ),
    );
  }
}
