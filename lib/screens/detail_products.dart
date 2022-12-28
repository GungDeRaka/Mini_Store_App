// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';

import '../constants/global_colors.dart';

class DetailProducts extends StatefulWidget {
  final String id;
  const DetailProducts({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailProducts> createState() => _DetailProductsState();
}

class _DetailProductsState extends State<DetailProducts> {
  ProductsModel? productsModel;
  Future<void> getProductInfo() async {
    productsModel = await APIHandler.getProductById(id: widget.id);
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    getProductInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: (productsModel == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  productsModel!.category!.name.toString(),
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${productsModel!.title}",
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                          text: "\$",
                          style: TextStyle(
                            color: Color.fromRGBO(33, 150, 243, 1),
                          ),
                        ),
                        TextSpan(
                            text: "${productsModel!.price}",
                            style: TextStyle(
                                color: lightTextColor,
                                fontWeight: FontWeight.w600)),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  height: screenSize.height * 0.25,
                  width: double.infinity,
                  child: Swiper(
                    itemCount: 3,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: FancyShimmerImage(
                        imageUrl: productsModel!.images![index],
                        boxFit: BoxFit.fill,
                        height: screenSize.height * 0.2,
                        width: double.infinity,
                        errorWidget: const Icon(
                          IconlyBold.danger,
                          color: Colors.red,
                          size: 28.0,
                        ),
                      ),
                    ),
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
                  height: 8.0,
                ),
                const Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "${productsModel!.description}",
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
    );
  }
}
