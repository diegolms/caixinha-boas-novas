import 'package:caixinha_boas_novas/dao/good_news_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'goodnews.db');
  return openDatabase(path,
    onCreate: (db, version) {
      db.execute(GoodNewsDao.tableSql);
    },
    version: 1,
        //onDowngrade: onDatabaseDowngradeDelete,
  );
}