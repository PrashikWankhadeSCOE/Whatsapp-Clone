import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:whatsappdemo/chat_page.dart';

import '../Card.dart';

dynamic database;

Future<void> connectionMessage() async {
  database = await openDatabase(
    join(await getDatabasesPath(), 'collectionDB.db'),
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
        CREATE TABLE CHATS(
          name TEXT PRIMARY KEY,
          picture TEXT,
          latest_timestamp TEXT,
          lastChat TEXT
        )
      ''');
    },
  );
  final localdb = await database;
  messageList = await localdb.query('MESSAGE');
  list = await localdb.query('CHATS');
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

Future addChats({
  required String name,
  String lastChat = "No message yet",
  String picture =
      'https://i.pinimg.com/564x/a2/11/7e/a2117e75dc55c149c2c68cbadee1f16e.jpg',
  required String latest_timestamp,
}) async {
  final localDB = await database;

  await localDB.insert(
      'Chats',
      {
        'name': name,
        'picture': picture,
        'lastChat': lastChat,
        'latest_timestamp': latest_timestamp,
      },
      conflictAlgorithm: ConflictAlgorithm.replace);

  list = await localDB.query('CHATS');
  print('chat list updated');
}
