import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:whatsappdemo/chat_page.dart';

dynamic database;

Future<void> connectionMessage() async {
  database = await openDatabase(
    join(await getDatabasesPath(), 'MessageDB.db'),
    version: 1,
    onCreate: (db, version) {
      db.execute('''
        CREATE TABLE MESSAGE(
          id INTEGER PRIMARY KEY,
          message Text,
          messageTime Text,
          isSent INTEGER
        )
      ''');
    },
  );
  final localdb = await database;
  messageList = await localdb.query('MESSAGE');
}
