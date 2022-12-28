import 'package:flutter/material.dart';

class CategoriesModel with ChangeNotifier {
  int? id;
  String? name;
  String? image;

  CategoriesModel({this.id, this.name, this.image});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
static List<CategoriesModel> categoriesFromSnapshot(List categoriesSnapshot) {
    ///dalam kasus ini [tempList] merupakan [productSnapshot]
    return categoriesSnapshot.map((data) => CategoriesModel.fromJson(data)).toList();
  }
}
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['image'] = image;
  //   return data;
  // }