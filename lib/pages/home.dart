import 'package:flutter/material.dart';
import 'package:meat_list/data/meat.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var meats = getMeat();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meat List'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        children: [
          for (var meat in meats)
            ListTile(
              leading: Image.asset(meat.image),
              title: Text(meat.name),
            )
        ],
      ),
    );
  }
}
