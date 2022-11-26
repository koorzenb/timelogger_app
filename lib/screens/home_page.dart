import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  static String routename = '/home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_rounded,
              color: Theme.of(context).colorScheme.secondary,
            )),
        title: Text(
          'TimeLogger',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Expanded(
              child: Center(
                child: Text("charts here"),
              ),
            ),
            Divider(),
            Expanded(
              child: Center(
                child: Text("entries here"),
              ),
            )
          ],
        ),
      )),
    );
  }
}
