import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meat_list/data/database.dart';
import 'package:meat_list/data/meat.dart';
import 'package:meat_list/data/app_style.dart';
import '../widgets/dialog_add_meat.dart';
import '../widgets/dialog_confirm.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final database = Database(dotenv.env['MONGO_URI']!);
  List<Meat> _meat = [];

  @override
  void initState() {
    database.open().then((_) {
      database.read('meat').then((value) {
        setState(() {
          _meat = value;
        });
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var meatOp = MeatOperation();
    // var getMeat = meatOp.getMeat();
    return Scaffold(
      appBar: const AppBars(),
      body: ListView.builder(
        itemCount: _meat.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 15, right: 15),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const VerticalDivider(),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios_sharp),
                      onPressed: () {
                        AppStyles.toastMessage('Detail');
                      },
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                tileColor: Theme.of(context).colorScheme.primaryContainer,
                title: Text(
                  _meat[index].name,
                  style: AppStyles.listTitle(context),
                ),
                subtitle: Text(
                  _meat[index].description,
                  style: AppStyles.listSubTitle(context),
                ),
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AddDialog(
                          meat: _meat[index],
                        );
                      }).then((value) {
                    setState(() {
                      // meatOp.editMeat(
                      //   Meat(value[0], value[1], value[2]),
                      //   index,
                      // );

                      AppStyles.toastMessage('Meat Edited');
                    });
                  });
                },
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ConfirmDialog(meat: _meat[index]);
                      }).then((value) {
                    if (value) {
                      setState(() {
                        // meatOp.removeMeat(getMeat[index]);
                        AppStyles.toastMessage('Meat Removed');
                      });
                    }
                  });
                },
                textColor: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              const SizedBox(height: 5),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5.0,
        highlightElevation: 10.0,
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AddDialog(
                  meat: null,
                );
              }).then((value) {
            database.insert('meat',
                Meat(name: value[0], image: value[1], description: value[2]));
            AppStyles.toastMessage('Meat Added');
            database.read('meat').then((value) {
              setState(() {
                _meat = value;
              });
            });
          });
        },
        splashColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
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
      title: Center(
        child: Text(
          'Meat List',
          style: AppStyles.appBarStyle(context),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      surfaceTintColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
