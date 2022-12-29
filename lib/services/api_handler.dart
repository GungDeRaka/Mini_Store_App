import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/constants/api_consts.dart';
import 'package:store_api_flutter_course/models/categories_model.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/models/users_model.dart';

class APIHandler {
// https://api.escuelajs.co/api/v1/products

  static Future<List> getSomeData(
      {required String target, String? limit}) async {
    ///try-catch to handle the error
    try {
      var uri = Uri.https(
          baseURL,
          "api/v1/$target",
          target == "products"
              ? {"offset": "0", "limit": limit}
              : {});
      var response = await http.get(uri);
      var data = jsonDecode(
          response.body); //*data iterable(parent dari list,map & set)
      List<Map<String, dynamic>> tempList = [];
      if (response.statusCode != 200) {
        throw data["message"];
      }
      for (var v in data) {
        tempList.add(v);
      }

      return tempList;
    } catch (error) {
      log("An error occured while getting product info $error");
      throw error.toString();
    }
  }

  static Future<List<ProductsModel>> getProducts(
      {required String limit}) async {
    List temp = await getSomeData(target: "products");
    return ProductsModel.productFromSnapshot(temp);
  }

  static Future<List<CategoriesModel>> getCategories() async {
    List temp = await getSomeData(target: "categories");
    return CategoriesModel.categoriesFromSnapshot(temp);
  }

  static Future<List<UsersModel>> getUsers() async {
    List temp = await getSomeData(target: "users");
    return UsersModel.usersFromSnapshot(temp);
  }

  static Future<ProductsModel> getProductById({required String id}) async {
    try {
      var uri = Uri.https(baseURL, "api/v1/products/$id");
      var response = await http.get(uri);
      var data = jsonDecode(
          response.body); //*data iterable(parent dari list,map & set)
      if (response.statusCode != 200) {
        throw data["message"];
      }
      return ProductsModel.fromJson(data);
    } catch (error) {
      log("An error occured while getting product info $error");
      throw error.toString();
    }
  }
}
