import 'package:flutter/material.dart';
import 'package:meat_list/data/meat.dart';
import 'package:meat_list/data/text_styles.dart';
import '../widgets/meat_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var meatOp = MeatOperation();
    var getMeat = meatOp.getMeat();
    return Scaffold(
      appBar: const AppBars(),
      body: ListView(
        children: [
          for (var meat in getMeat)
            ListTile(
              title: MeatCard(meat: meat),
              onLongPress: () {
                setState(() {
                  meatOp.removeMeat(meat);
                });
              },
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            meatOp.addMeat(Meat('asd', 'asd', 'asd'));
          });
        },
        child: const Icon(Icons.add),
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
