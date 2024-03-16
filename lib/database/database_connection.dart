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
          id INTEGER PRIMARY KEY AUTOINCREMENT,
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

Future addMessage({
  required String message,
  required String messageTime,
  required int isSent,
  int id = -1,
}) async {
  final localDB = await database;
  if (id == -1) {
    await localDB.insert(
        "MESSAGE",
        {
          'message': message,
          'messageTime': messageTime,
          'isSent': isSent,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  } else {
    await localDB.insert(
        'MESSAGE',
        {
          'id': id,
          'message': message,
          'messageTime': messageTime,
          'isSent': isSent,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  messageList = await localDB.query('MESSAGE');
  print('message list updated');
}
