import "package:flutter/material.dart";
import "package:whatsappdemo/AuthorizationPage.dart";
import "package:whatsappdemo/database/database_connection.dart";
// import "package:sqflite_common_ffi/sqflite_ffi.dart";

void main() async {
  // databaseFactory = databaseFactoryFfi;
  WidgetsFlutterBinding.ensureInitialized();
  await connectionMessage();
  print('in main');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Authorization(),
      debugShowCheckedModeBanner: false,
    );
  }
}
