import 'package:mongo_dart/mongo_dart.dart';

import 'app_style.dart';
import 'meat.dart';

class Database {
  final Future<Db> _dbFuture;
  Database(String uri) : _dbFuture = Db.create(uri);

  Future<void> open() async {
    var db = await _dbFuture;
    await db.open();
  }

  Future<void> close() async {
    var db = await _dbFuture;
    await db.close();
  }

  Future<void> insert(String collectionName, Meat data) async {
    var db = await _dbFuture;

    final collection = db.collection(collectionName);
    final existingMeat = await collection.findOne({'name': data.name});
    await collection.createIndex(key: 'name', unique: true);
    if (existingMeat == null) {
      await collection
          .insert(data.toJson())
          .onError(
            (error, stackTrace) => AppStyles.toastMessage('error $error'),
          )
          .whenComplete(() => AppStyles.toastMessage('Meat Added'));
    } else {
      AppStyles.toastMessage('Meat name already exist');
    }
  }

  Future<List<Meat>> read(String collectionName) async {
    var db = await _dbFuture;

    final collection = db.collection(collectionName);
    var cursor = collection.find();
    var result = await cursor
        .map((event) => Meat.fromJson(event))
        .toList()
        .onError((error, stackTrace) => AppStyles.toastMessage('error $error'));
    return result;
  }

  Future<void> edit(String collectionName, Meat data) async {
    var db = await _dbFuture;

    var collection = db.collection(collectionName);
    await collection
        .update(where.eq('name', data.name), data.toJson())
        .onError(
          (error, stackTrace) => AppStyles.toastMessage('error $error'),
        )
        .whenComplete(() => AppStyles.toastMessage('Meat Edited'));
  }

  Future<void> delete(String collectionName, Meat data) async {
    var db = await _dbFuture;
    var collection = db.collection(collectionName);
    await collection
        .remove(where.eq('name', data.name))
        .onError(
          (error, stackTrace) => AppStyles.toastMessage('error $error'),
        )
        .whenComplete(() => AppStyles.toastMessage('Meat Deleted'));
  }
}
