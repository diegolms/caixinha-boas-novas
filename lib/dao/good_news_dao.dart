import 'package:caixinha_boas_novas/database/app_database.dart';
import 'package:caixinha_boas_novas/models/good_news.dart';
import 'package:sqflite/sqlite_api.dart';


class GoodNewsDao {

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_description TEXT)';

  static const String _tableName = 'goodnews';
  static const String _id = 'id';
  static const String _description = 'description';


  Future<int> save(GoodNews goodNew) async{
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(goodNew);
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(GoodNews goodNew) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_description] = goodNew.description;
    return contactMap;
  }

  Future<List<GoodNews>> findAll() async {

    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<GoodNews> goodNews = _toList(result);
    return goodNews;
  }

  List<GoodNews> _toList(List<Map<String, dynamic>> result) {
    final List<GoodNews> goodNews = [];
    for (Map<String, dynamic> row in result) {
      final GoodNews goodNew = GoodNews(
        row[_id],
        row[_description],
      );
      goodNews.add(goodNew);
    }
    return goodNews;
  }

}