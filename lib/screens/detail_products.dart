import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../constants/global_colors.dart';


class DetailProducts extends StatelessWidget {
  const DetailProducts({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          const SizedBox(
            height: 12.0,
          ),
          const Text(
            "Category",
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Lorem Ipsum",
                style: TextStyle(
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
                      text: "168.00",
                      style: TextStyle(
                          color: lightTextColor, fontWeight: FontWeight.w600)),
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
                padding: EdgeInsets.all(14.0),
                child: FancyShimmerImage(
      imageUrl:  "https://i.ibb.co/vwB46Yq/shoes.png",
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
          Text(
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
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
