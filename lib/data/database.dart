import 'package:mongo_dart/mongo_dart.dart';

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
    await collection.insert(data.toJson());
  }

  Future<List<Meat>> read(String collectionName) async {
    var db = await _dbFuture;
    final collection = db.collection(collectionName);
    var cursor = collection.find();
    var result = await cursor.map((event) => Meat.fromJson(event)).toList();
    return result;
  }
}
