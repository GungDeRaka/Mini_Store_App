import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/models/users_model.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelProvider = Provider.of<UsersModel>(context);
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        child: FancyShimmerImage(
          imageUrl: modelProvider.avatar.toString(),
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
        "${modelProvider.name}",
        style: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "${modelProvider.email}",
        style: const TextStyle(
          fontSize: 12.0,
        ),
      ),
      trailing: Text(
        "${modelProvider.role}",
        style: const TextStyle(
          fontSize: 12.0,
        ),
      ),
    );
  }
}
