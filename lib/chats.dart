import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsappdemo/Card.dart';
import 'package:whatsappdemo/chat_page.dart';
import 'package:whatsappdemo/database/database_connection.dart';

class WhatsappChats extends StatefulWidget {
  const WhatsappChats({super.key});

  @override
  State<WhatsappChats> createState() => _WhatsappChatsState();
}

class _WhatsappChatsState extends State<WhatsappChats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Chats',
          style: GoogleFonts.openSans(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
        ),
        actions: const [
          Icon(
            Icons.mode_edit_outline_outlined,
            color: Color(0xff007AFF),
          )
        ],
        backgroundColor: const Color(0xffF6F6F6),
        foregroundColor: const Color(0xff007AFF),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Broadcast Lists',
                  style: GoogleFonts.openSans(
                    color: const Color(0xff007AFF),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'New Group',
                  style: GoogleFonts.openSans(
                    color: const Color(0xff007AFF),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    connectionMessage();
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Chats(
                          name: list[index]['name'],
                          imageurl: list[index]['picture'],
                        );
                      },
                    ),
                  );
                },
                child: CardDemo(index: index),
              );
            },
          ),
        ],
      ),
    );
  }
}
