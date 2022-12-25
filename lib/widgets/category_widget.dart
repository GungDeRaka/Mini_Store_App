
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:store_api_flutter_course/constants/global_colors.dart';


class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.45,
      width: size.width * 0.45,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        color: Colors.blue,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
              child: FancyShimmerImage(
      imageUrl:  "https://i.ibb.co/vwB46Yq/shoes.png",
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
            Text(
              "Product Category",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  backgroundColor: lightCardColor.withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
  }
}
