import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/widgets/users_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        actions: const [],
      ),
      body: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return const UsersWidget();
        },
      ),
    );
  }
}
