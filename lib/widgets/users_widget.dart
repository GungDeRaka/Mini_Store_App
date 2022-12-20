import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        child: FancyShimmerImage(
          imageUrl: "https://i.ibb.co/vwB46Yq/shoes.png",
          boxFit: BoxFit.fill,
          height: size.width * 0.15,
          width: size.width * 0.15,
          errorWidget: const Icon(
            IconlyBold.danger,
            color: Colors.red,
            size: 28.0,
          ),
        ),
      ),
      title: Text(
        "Sugeng",
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "sugeng.ganteng@gmail.com",
        style: TextStyle(
          fontSize: 12.0,
        ),
      ),
      trailing: Text(
        "Dog Hairstylist",
        style: TextStyle(
          fontSize: 12.0,
        ),
      ),
    );
  }
}
