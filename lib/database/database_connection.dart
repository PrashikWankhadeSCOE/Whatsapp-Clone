import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:whatsappdemo/chat_page.dart';

import '../Card.dart';

dynamic database;

Future<void> connectionMessage() async {
  database = await openDatabase(
    join(await getDatabasesPath(), 'MessageDB.db'),
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE MESSAGE(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          message Text,
          messageTime Text,
          isSent INTEGER
        )
      ''');
      await db.execute('''
        CREATE TABLE CHATSTABLE(
          name TEXT PRIMARY KEY,
          picture TEXT,
          latest_timestamp TEXT,
          lastChat TEXT,
        )
      ''');
    },
  );
  final localdb = await database;
  messageList = await localdb.query('MESSAGE');
  // list = await localdb.query('CHATSTABLE');
  print(list);
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

// Future addChats({
//   required String name,
//   String lastChat = "No message yet",
//   String picture =
//       'data:image/jpeg;base64,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',
//   required String latest_timestamp,
// }) async {
//   final localDB = await database;

//   await localDB.insert(
//       'Chats',
//       {
//         'name': name,
//         'picture': picture,
//         'lastChat': lastChat,
//         'latest_timestamp': latest_timestamp,
//       },
//       conflictAlgorithm: ConflictAlgorithm.replace);

//   list = await localDB.query('CHATS');
//   print('chat list updated');
// }
