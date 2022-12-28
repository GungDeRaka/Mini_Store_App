import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/constants/global_colors.dart';
import '../models/categories_model.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    CategoriesModel modelProvider = Provider.of<CategoriesModel>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
            child: FancyShimmerImage(
              imageUrl: modelProvider.image.toString(),
              boxFit: BoxFit.cover,
              height: size.height * 0.3,
              width: double.infinity,
              errorWidget: const Icon(
                IconlyBold.danger,
                color: Colors.red,
                size: 28.0,
              ),
            ),
          ),
          Text(
            modelProvider.name.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                backgroundColor: lightCardColor.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
