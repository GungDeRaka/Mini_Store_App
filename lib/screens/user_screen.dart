import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/models/users_model.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';
import 'package:store_api_flutter_course/widgets/users_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<UsersModel>>(
            initialData: const [],
            future: APIHandler.getUsers(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                // shrinkWrap: true,
                // physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    Center(
                      child: Text("An error occured ${snapshot.error}"),
                    );
                  } else if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ChangeNotifierProvider<UsersModel>.value(
                      value: snapshot.data == null
                          ? snapshot.data![0]
                          : snapshot.data![index],
                      child: const UsersWidget());
                },
              );
            }),
      ),
    );
  }
}
