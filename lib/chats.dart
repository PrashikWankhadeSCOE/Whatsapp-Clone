import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsappdemo/Card.dart';

import 'chat_page.dart';
import 'database/database_connection.dart';

class WhatsappChats extends StatefulWidget {
  const WhatsappChats({super.key});

  @override
  State<WhatsappChats> createState() => _WhatsappChatsState();
}

class _WhatsappChatsState extends State<WhatsappChats> {
  void _startChatWithNewContact(BuildContext context) {
    // Display a dialog or navigate to a new screen for adding a new contact
    TextEditingController newContactController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('New Contact'),
          content: TextField(
            controller: newContactController,
            decoration: const InputDecoration(labelText: 'Enter contact name'),
            // Logic to handle entering new contact information
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                final now = DateTime.now();
                String formatter =
                    "${now.hour.toString()}:${now.minute.toString()}";
                setState(() {
                  if (newContactController.text.trim().isNotEmpty) {
                    addChats(
                        name: newContactController.text.trim(),
                        latest_timestamp: formatter);
                  }
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
        actions: [
          selfInfo(context),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            child: const Icon(Icons.contact_emergency_outlined),
            onTap: () {
              _startChatWithNewContact(context);
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: const Color(0xffF6F6F6),
        foregroundColor: const Color(0xff007AFF),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Scrollable(
            viewportBuilder: (BuildContext context, ViewportOffset position) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
              );
            },
          ),
          Expanded(
            child: ListView.builder(
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
              physics: const ClampingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector selfInfo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Self Information"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        color: Colors.green,
                      ),
                      padding: const EdgeInsets.all(0),
                      child: const CircleAvatar(
                        radius: 10,
                        foregroundImage: NetworkImage(
                          "https://media.licdn.com/dms/image/D4D03AQGnxV3eRjNu1g/profile-displayphoto-shrink_800_800/0/1703592629183?e=2147483647&v=beta&t=ZU6D9dWLPXEz94GmoVORl79FwmqB4NToYmBAQ63qkdg",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Prashik Wankhade",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      "+91 86260 45643",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Close"),
                  )
                ],
              );
            });
      },
      child: const Icon(
        Icons.mode_edit_outline_outlined,
        color: Color(0xff007AFF),
      ),
    );
  }
}
