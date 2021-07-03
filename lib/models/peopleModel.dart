import 'package:sqflite/sqflite.dart';
import 'package:sus_plus/class/people.dart';
import 'package:sus_plus/helper/databasseHelper.dart';

class PeopleModel {
  //People people = People();
  DatabaseHelper database = DatabaseHelper();

  Future<int> create(People people) async {
    Database db = await database.db;
    var resp = await db.insert('people', people.toMap());
    return resp;
  }

  // return
  Future<List<People>> getPeople() async {
    Database db = await database.db;
    List<People> all = [];
    List<Map> maps = await db.query('people', columns: [
      'idpeople',
      'name',
      'birth',
    ]);
    if (maps.length > 0) {
      all = maps.map((e) => People.fromMap(e)).toList();
      return all;
      //return People.fromMap(maps.first);
    } else {
      return null;
    }
  }
}
