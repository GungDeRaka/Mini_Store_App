// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';

import 'package:store_api_flutter_course/screens/detail_products.dart';

import '../constants/global_colors.dart';

class ProductFeeds extends StatelessWidget {

  final String title;
  final String imageUrl;
  const ProductFeeds({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child: const DetailProducts()));
          },
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
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
                              text: "168.00",
                              style: TextStyle(
                                  color: lightTextColor,
                                  fontWeight: FontWeight.w600)),
                        ]),
                      ),
                    ),
                    const Icon(IconlyBold.heart)
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  child: FancyShimmerImage(
                    imageUrl: imageUrl,
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
                padding: EdgeInsets.all(8),
                child: Text(
                  title,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),
                ),
              ),
              // SizedBox(
              //   height: size.height * 0.02,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
