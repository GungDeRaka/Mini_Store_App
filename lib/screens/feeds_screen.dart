import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/products_model.dart';
import '../services/api_handler.dart';
import '../widgets/product_feeds.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final ScrollController _scrollController = ScrollController();
  List<ProductsModel> productList = [];
  int limit =10;
  bool _isLoading = false;
  // bool _isLimit= false;
  Future<void> getProduct() async {
    productList = await APIHandler.getProducts(limit: limit.toString());
    setState(() {});
  }

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    
    _scrollController.addListener(() async {
      // if(limit==10){
      //   _isLimit = true;
      //   setState(() {
          
      //   });
      // }

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _isLoading = true;
        limit += 10;
        await getProduct();
        print(limit);
        _isLoading = false;
      }
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Product"),
        actions: const [],
      ),
      body: productList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              controller: _scrollController,
              children: [
                GridView.builder(
                  itemCount: productList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ChangeNotifierProvider.value(
                        value: productList[index], child: const ProductFeeds());
                  },
                ),
                if (limit == 10)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
    );
  }
}
