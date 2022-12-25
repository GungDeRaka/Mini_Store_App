import 'package:flutter/foundation.dart';

import '../models/categories_model.dart';

class ProductsModel with ChangeNotifier{
  int? id;
  String? title;
  int? price;
  String? description;
  CategoriesModel? category;
  List<String>? images;
  int? categoryId;

  ProductsModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.images,
      this.categoryId});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? CategoriesModel.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
    categoryId = json['categoryId'];
  }
    static List<ProductsModel> productFromSnapshot(List productSnapshot) {
    ///dalam kasus ini [tempList] merupakan [productSnapshot]
    return productSnapshot.map((data) => ProductsModel.fromJson(data)).toList();
  }
}


///[some unused function]
//! mthod toJson sbnrnya bisa dihilangin
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['id'] = id;
  //   data['title'] = title;
  //   data['price'] = price;
  //   data['description'] = description;
  //   if (category != null) {
  //     data['category'] = category!.toJson();
  //   }
  //   data['images'] = images;
  //   data['categoryId'] = categoryId;
  //   return data;
  // }
//?make func List<productmodel> ---(list){
//}
  // static List<ProductsModel> productFromSnapshot(List productSnapshot) {
  //   ///dalam kasus ini [tempList] merupakan [productSnapshot]
  //   return productSnapshot.map((data) => ProductsModel.fromJson(data)).toList();
  // }