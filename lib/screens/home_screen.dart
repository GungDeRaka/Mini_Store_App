import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            splashColor: IconTheme.of(context).color,
            hoverColor: Theme.of(context).scaffoldBackgroundColor,
            onPressed: () {},
            icon: const Icon(IconlyBold.category),
          ),
          title: const Text(
            "Home",
          ),
          actions: [
            IconButton(
              splashColor: IconTheme.of(context).color,
              hoverColor: Theme.of(context).scaffoldBackgroundColor,
              onPressed: () {},
              icon: const Icon(
                IconlyBold.user3,
              ),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            const SizedBox(
              height: 12.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).cardColor,
                hintText: 'Search',
                suffixIcon: Icon(
                  IconlyLight.search,
                  color: IconTheme.of(context).color,
                ),
                hintStyle: const TextStyle(
                  color: Colors.blueGrey,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
