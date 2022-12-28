// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../models/products_model.dart';
import '../screens/detail_products.dart';
import '../widgets/favourite_widget.dart';
import '../constants/global_colors.dart';

class ProductFeeds extends StatelessWidget {
  const ProductFeeds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelProvider = Provider.of<ProductsModel>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.size,
                    alignment: Alignment.bottomCenter,
                    child: DetailProducts(
                      id: modelProvider.id.toString(),
                    )));
          },
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          child: SizedBox(
            height: size.height * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                              text: "\$",
                              style: TextStyle(
                                color: Color.fromRGBO(33, 150, 243, 1),
                              ),
                            ),
                            TextSpan(
                                text: "${modelProvider.price}",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: lightTextColor,
                                    fontWeight: FontWeight.w600)),
                          ]),
                        ),
                      ),
                      const FavouriteWidget(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    child: FancyShimmerImage(
                      imageUrl: modelProvider.images![0],
                      boxFit: BoxFit.fill,
                      height: size.height * 0.2,
                      width: double.infinity,
                      errorWidget: const Icon(
                        IconlyBold.danger,
                        color: Colors.red,
                        size: 28.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SizedBox(
                    // width: size.width *0.25,
                    child: Text(
                      modelProvider.title.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:
                          const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: size.height * 0.02,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
