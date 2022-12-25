// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';


class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.22,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
        gradient: LinearGradient(
            colors: [
              Color(0xFF7A60A5),
              Color(0xFF82C3DF),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.mirror),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 106, 74, 158),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Get the special discount",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Flexible(
                        child: SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              "50 %\nOFF",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                // fontSize: 300,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
          width: 20.0,
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(14.0),
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
            )
          ),
          const SizedBox(
          width: 20.0,
          ),
        ],
      ),
    );
  }
}
