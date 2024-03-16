import "package:flutter/material.dart";
import "package:whatsappdemo/AuthorizationPage.dart";
import "package:whatsappdemo/database/database_connection.dart";

void main() async {
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
