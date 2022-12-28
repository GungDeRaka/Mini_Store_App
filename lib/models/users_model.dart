import 'package:flutter/material.dart';

class UsersModel with ChangeNotifier{
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;

  UsersModel(
      {this.id, this.email, this.password, this.name, this.role, this.avatar});

  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
  }

  static Future<List<UsersModel>> usersFromSnapshot(List usersSnapshot) async {
    ///dalam kasus ini [tempList] merupakan [productSnapshot]
    return usersSnapshot.map((data) => UsersModel.fromJson(data)).toList();
  }

}
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['email'] = this.email;
  //   data['password'] = this.password;
  //   data['name'] = this.name;
  //   data['role'] = this.role;
  //   data['avatar'] = this.avatar;
  //   return data;
  // }