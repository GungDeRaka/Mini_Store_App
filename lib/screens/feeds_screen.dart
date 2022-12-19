import 'package:flutter/material.dart';

import '../widgets/product_feeds.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Product"),
        actions: const [],
      ),
      body: GridView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
                childAspectRatio: 0.74,
              ),
              itemBuilder: (BuildContext context, int index) {
                return const ProductFeeds();
              },
            ),
    );
  }
}
