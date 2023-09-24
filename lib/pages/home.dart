import 'package:flutter/material.dart';
import 'package:meat_list/data/meat.dart';
import '../widgets/meat_card.dart';

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
              title: MeatCard(meat: meat),
            )
        ],
      ),
    );
  }
}
