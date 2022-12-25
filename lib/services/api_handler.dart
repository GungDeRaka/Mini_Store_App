import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/constants/api_consts.dart';
import 'package:store_api_flutter_course/models/products_model.dart';

class APIHandler {
// https://api.escuelajs.co/api/v1/products
  static Future<List<ProductsModel>> getAllData() async {
    var uri = Uri.https(baseURL, "api/v1/products");
    var response = await http.get(uri);

//?variabel untuk menampung data pd body json
    var data =
        jsonDecode(response.body); //*data iterable(parent dari list,map & set)
    List tempList = [];

    ///kita gunakan untuk menampung [data]
    for (var v in data) {
      tempList.add(v);

      ///untuk menambah angota list [tempList]
    }
    return ProductsModel.productFromSnapshot(tempList);
  }
}
