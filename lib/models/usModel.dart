import 'package:sqflite/sqflite.dart';
import 'package:sus_plus/class/us.dart';
import 'package:sus_plus/helper/databasseHelper.dart';

class UsModel {
  //Us us = Us();
  DatabaseHelper database = DatabaseHelper();

  Future<int> create(Us us) async {
    Database db = await database.db;
    var resp = await db.insert('peaplo', us.toMap());
    return resp;
  }

  // return
  Future<List<Us>> showAll() async {
    Database db = await database.db;
    List<Us> all = [];
    List<Map> maps = await db.query('us', columns: [
      'idus',
      'type',
      'name',
      'location',
      'phone',
      'office_hours',
      'geolocation',
    ]);
    if (maps.length > 0) {
      all = maps.map((e) => Us.fromMap(e)).toList();
      return all;
      //return Us.fromMap(maps.first);
    } else {
      return null;
    }
  }
}
