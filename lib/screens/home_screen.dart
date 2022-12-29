import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import '../screens/category_screen.dart';
import '../screens/feeds_screen.dart';
import '../screens/user_screen.dart';
import '../widgets/product_feeds.dart';
import '../widgets/discount_banner_widget.dart';
import '../services/api_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  // List<ProductsModel> productList = [];

  // Future<void> getProduct() async {
  //   productList = await APIHandler.getProducts();
  //   setState(() {});
  // }

  @override
  void initState() {
    _searchController;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    APIHandler.getProducts(limit: "3");
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            splashColor: IconTheme.of(context).color,
            hoverColor: Theme.of(context).scaffoldBackgroundColor,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: const CategoryScreen(),
                      type: PageTransitionType.fade));
            },
            icon: const Icon(IconlyBold.category),
          ),
          title: const Text(
            "Home",
          ),
          actions: [
            IconButton(
              splashColor: IconTheme.of(context).color,
              hoverColor: Theme.of(context).scaffoldBackgroundColor,
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const UserScreen(),
                        type: PageTransitionType.fade));
              },
              icon: const Icon(
                IconlyBold.user3,
              ),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).cardColor,
                hintText: 'Search',
                suffixIcon: Icon(
                  IconlyLight.search,
                  color: IconTheme.of(context).color,
                ),
                hintStyle: const TextStyle(
                  color: Colors.blueGrey,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(
                    width: 2.5,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 12.0,
            ),
            SizedBox(
              height: screenSize.height * 0.25,
              width: double.infinity,
              child: Swiper(
                itemCount: 3,
                itemBuilder: (context, index) => const DiscountBanner(),
                autoplay: true,
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.white,
                      activeColor: Colors.red,
                    )),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            InkWell(
              hoverColor: Theme.of(context).scaffoldBackgroundColor,
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: const FeedsScreen(),
                        childCurrent: const HomeScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Latest Product",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    IconlyBold.arrowRight2,
                    size: 28,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            FutureBuilder<List<ProductsModel>>(
                initialData: const [],
                future: APIHandler.getProducts(limit: "3"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    Center(
                      child: Text("An error occured ${snapshot.error}"),
                    );
                  } else if (snapshot.data == null) {
                    const Center(
                      child: Text("No products has been added yet"),
                    );
                  }
                  return GridView.builder(
                    itemCount: snapshot.data!.length,
                    
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return ChangeNotifierProvider<ProductsModel>.value(
                        value: snapshot.data![index],
                        child: const ProductFeeds(),
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
