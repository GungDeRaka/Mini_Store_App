import 'package:flutter/material.dart';

import '../models/products_model.dart';
import '../services/api_handler.dart';
import '../widgets/product_feeds.dart';

class FeedsScreen extends StatefulWidget {
  FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  List<ProductsModel> productList = [];

  Future<void> getProduct() async {
    productList = await APIHandler.getAllData();
    setState(() {});
  }

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Product"),
        actions: const [],
      ),
      body: GridView.builder(
        itemCount: productList.length,
        // shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductFeeds(
            imageUrl: productList[index].images![0],
            title: productList[index].title.toString(),
          );
        },
      ),
    );
  }
}
