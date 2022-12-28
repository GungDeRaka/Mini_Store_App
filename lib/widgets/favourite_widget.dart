import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class FavouriteWidget extends StatefulWidget {
  const FavouriteWidget({super.key});

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  bool _isFavourite = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isFavourite = !_isFavourite;
        });
      },
      icon: Icon(
        _isFavourite ? IconlyLight.heart : IconlyBold.heart,
        size: 24.0,
      ),
    );
  }
}
