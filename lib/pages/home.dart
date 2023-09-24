import 'package:flutter/material.dart';
import 'package:meat_list/data/meat.dart';
import 'package:meat_list/data/text_styles.dart';
import '../widgets/meat_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var meat = MeatOperation();
    meat.setMeat();
    var getMeat = meat.getMeat();
    return Scaffold(
      appBar: const AppBars(),
      body: ListView(
        children: [
          for (var meat in getMeat)
            ListTile(
              title: MeatCard(meat: meat),
            )
        ],
      ),
    );
  }
}

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  const AppBars({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(
        child: Text(
          'Meat List',
          style: appBarStyle,
        ),
      ),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
