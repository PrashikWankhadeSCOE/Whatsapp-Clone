import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsappdemo/Card.dart';
// import 'package:whatsappdemo/database/database_chats.dart';

class WhatsappChats extends StatefulWidget {
  const WhatsappChats({super.key});

  @override
  State<WhatsappChats> createState() => _WhatsappChatsState();
}

class _WhatsappChatsState extends State<WhatsappChats> {
  // @override
  // void initState() async {
  //   List<Map<String, dynamic>> demo = [
  //     {
  //       "id": 2,
  //       "name": "Alex",
  //       "picture": "https://image.ibb.co/cA2oOb/alex_1.jpg",
  //       "latest_timestamp": "10:00 AM",
  //       "lastChat":
  //           "Or maybe not, let me check logistics and call you. Give me sometime"
  //     },
  //     {
  //       "id": 3,
  //       "name": "Bob",
  //       "picture": "https://image.ibb.co/gSyTOb/bob_1.jpg",
  //       "latest_timestamp": "12:30 AM",
  //       "lastChat": "Alright"
  //     },
  //     {
  //       "id": 4,
  //       "name": "Luke",
  //       "picture": "https://image.ibb.co/jOzeUG/luke_1.jpg",
  //       "latest_timestamp": "4:12 PM",
  //       "lastChat": "I will look into it"
  //     },
  //     {
  //       "id": 5,
  //       "name": "Bane",
  //       "picture": "https://image.ibb.co/cBZPww/bane_1.jpg",
  //       "latest_timestamp": "7:53 PM",
  //       "lastChat": "Exactly my point!"
  //     },
  //     {
  //       "id": 6,
  //       "name": "Darth Vader",
  //       "picture": "https://image.ibb.co/j4Ov3b/darth_vader_1.png",
  //       "latest_timestamp": "1:09 PM",
  //       "lastChat": "Not quite the same."
  //     },
  //     {
  //       "id": 7,
  //       "name": "Zach",
  //       "picture": "https://image.ibb.co/b4kxGw/zach_1.jpg",
  //       "latest_timestamp": "Yesterday",
  //       "lastChat": "I thought that the event was over long ago"
  //     },
  //     {
  //       "id": 8,
  //       "name": "Katie",
  //       "picture": "https://image.ibb.co/eLVWbw/katie_1.jpg",
  //       "latest_timestamp": "Yesterday",
  //       "lastChat": "nothing"
  //     },
  //     {
  //       "id": 9,
  //       "name": "Chloe",
  //       "picture": "https://image.ibb.co/ncAa3b/chloe_1.jpg",
  //       "latest_timestamp": "Wednesday",
  //       "lastChat": "sure i'll take it from you"
  //     },
  //     {
  //       "id": 10,
  //       "name": "Kennith",
  //       "picture": "https://image.ibb.co/fQKPww/kennith_1.jpg",
  //       "latest_timestamp": "Wednesday",
  //       "lastChat": "Take care, bye"
  //     },
  //     {
  //       "id": 11,
  //       "name": "Tara",
  //       "picture": "https://image.ibb.co/dM6hib/tara_1.jpg",
  //       "latest_timestamp": "Monday",
  //       "lastChat": "Not today"
  //     },
  //     {
  //       "id": 12,
  //       "name": "Gary",
  //       "picture": "https://image.ibb.co/gsF8Ob/gary_1.jpg",
  //       "latest_timestamp": "Sunday",
  //       "lastChat": "Whatever works for you!"
  //     },
  //     {
  //       "id": 13,
  //       "name": "Zoey",
  //       "picture": "https://image.ibb.co/nd0Wbw/zoey_1.jpg",
  //       "latest_timestamp": "8/12/2017",
  //       "lastChat": "Will get in touch"
  //     },
  //     {
  //       "id": 14,
  //       "name": "Ash",
  //       "picture": "https://image.ibb.co/iasYpG/ash_1.jpg",
  //       "latest_timestamp": "6/12/2017",
  //       "lastChat": "Ok"
  //     },
  //     {
  //       "id": 15,
  //       "name": "Zen",
  //       "picture": "https://image.ibb.co/eeqWbw/zen_1.jpg",
  //       "latest_timestamp": "19/11/2017",
  //       "lastChat": "Lol"
  //     }
  //   ];

  //   for (int i = 0; i < demo.length; i++) {
  //     await addChats(
  //       name: demo[i]['name'],
  //       picture: demo[i]['picture'],
  //       lastChat: demo[i]['lastChat'],
  //       latest_timestamp: demo[i]['latest_timestamp'],
  //     );
  //     setState(() {});
  //   }
  //   super.initState();
  // }

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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          const Divider(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (BuildContext context, index) {
              return CardDemo(index: index);
            },
          ),
        ],
      ),
    );
  }
}
