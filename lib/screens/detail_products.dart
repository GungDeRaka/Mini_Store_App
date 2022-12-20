import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../consts/global_colors.dart';
import '../widgets/discount_banner_widget.dart';

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
                padding: const EdgeInsets.all(14.0),
                child: Image.network(
                    width: double.infinity,
                    // height: double.infinity,
                    "https://i.ibb.co/vwB46Yq/shoes.png",
                    fit: BoxFit.contain,),
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
          Text("Description",
          style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          ),
          ),
          const SizedBox(
          height: 10.0,
          ),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
          style: TextStyle(
          fontSize: 16.0,
          ),
          ),
        ],
      ),
    );
  }
}
