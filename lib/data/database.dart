import 'package:mongo_dart/mongo_dart.dart';

import 'meat.dart';

class Database {
  final Db _db;
  Database(String uri) : _db = Db(uri);

  Future<void> open() async {
    _db.open();
  }

  Future<void> close() async {
    _db.close();
  }

  Future<void> insert(String collectionName, Meat data) async {
    final collection = _db.collection(collectionName);
    await collection.insertOne(data.toJson());
  }
}
