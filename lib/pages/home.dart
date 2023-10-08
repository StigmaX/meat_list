import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meat_list/data/database.dart';
import 'package:meat_list/data/meat.dart';
import 'package:meat_list/data/app_style.dart';
import 'package:meat_list/pages/detail.dart';
import '../widgets/app_bar.dart';
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
  Future? _data;

  @override
  void initState() {
    database.open();
    _data = database.read('meat');
    super.initState();
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBars(),
      body: FutureBuilder(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Error has occured',
                    style: AppStyles.listTitle(context),
                  ),
                  TextButton(
                      onPressed: () async {
                        setState(() {
                          _data = database.read('meat');
                        });
                      },
                      child: const Icon(Icons.refresh))
                ],
              ),
            );
          } else {
            _meat = snapshot.data!;
            return RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  _data = database.read('meat');
                });
              },
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              child: ListView.builder(
                itemCount: _meat.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding:
                            const EdgeInsets.only(left: 15, right: 15),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const VerticalDivider(),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward_ios_sharp),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPage(meat: _meat[index]),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        tileColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        title: Text(
                          _meat[index].name,
                          style: AppStyles.listTitle(context),
                        ),
                        subtitle: Text(
                          _meat[index].description,
                          style: AppStyles.listSubTitle(context),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddDialog(
                                  meat: _meat[index],
                                );
                              }).then((value) {
                            database
                                .edit(
                                    'meat',
                                    Meat(
                                        name: value[0],
                                        image: value[1],
                                        description: value[2]))
                                .then((value) {
                              database.read('meat').then((value) {
                                setState(() {
                                  _data = database.read('meat');
                                });
                              });
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
                              database
                                  .delete('meat', _meat[index])
                                  .then((value) {
                                setState(() {
                                  _data = database.read('meat');
                                });
                              });
                            }
                          });
                        },
                        textColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      const SizedBox(height: 5),
                    ],
                  );
                },
              ),
            );
          }
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
            database
                .insert(
                    'meat',
                    Meat(
                        name: value[0], image: value[1], description: value[2]))
                .then((value) {
              database.read('meat').then((value) {
                setState(() {
                  _data = database.read('meat');
                });
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
