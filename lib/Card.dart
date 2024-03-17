import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";

List<Map<String, dynamic>> list = [
  {
    "id": 2,
    "name": "Alex",
    "picture": "https://image.ibb.co/cA2oOb/alex_1.jpg",
    "latest_timestamp": "10:00 AM",
    "lastChat":
        "Or maybe not, let me check logistics and call you. Give me sometime"
  },
  {
    "id": 3,
    "name": "Bob",
    "picture": "https://image.ibb.co/gSyTOb/bob_1.jpg",
    "latest_timestamp": "12:30 AM",
    "lastChat": "Alright"
  },
  {
    "id": 4,
    "name": "Luke",
    "picture": "https://image.ibb.co/jOzeUG/luke_1.jpg",
    "latest_timestamp": "4:12 PM",
    "lastChat": "I will look into it"
  },
  {
    "id": 5,
    "name": "Bane",
    "picture": "https://image.ibb.co/cBZPww/bane_1.jpg",
    "latest_timestamp": "7:53 PM",
    "lastChat": "Exactly my point!"
  },
  {
    "id": 6,
    "name": "Darth Vader",
    "picture": "https://image.ibb.co/j4Ov3b/darth_vader_1.png",
    "latest_timestamp": "1:09 PM",
    "lastChat": "Not quite the same."
  },
  {
    "id": 7,
    "name": "Zach",
    "picture": "https://image.ibb.co/b4kxGw/zach_1.jpg",
    "latest_timestamp": "Yesterday",
    "lastChat": "I thought that the event was over long ago"
  },
  {
    "id": 8,
    "name": "Katie",
    "picture": "https://image.ibb.co/eLVWbw/katie_1.jpg",
    "latest_timestamp": "Yesterday",
    "lastChat": "nothing"
  },
  {
    "id": 9,
    "name": "Chloe",
    "picture": "https://image.ibb.co/ncAa3b/chloe_1.jpg",
    "latest_timestamp": "Wednesday",
    "lastChat": "sure i'll take it from you"
  },
  {
    "id": 10,
    "name": "Kennith",
    "picture": "https://image.ibb.co/fQKPww/kennith_1.jpg",
    "latest_timestamp": "Wednesday",
    "lastChat": "Take care, bye"
  },
  {
    "id": 11,
    "name": "Tara",
    "picture": "https://image.ibb.co/dM6hib/tara_1.jpg",
    "latest_timestamp": "Monday",
    "lastChat": "Not today"
  },
  {
    "id": 12,
    "name": "Gary",
    "picture": "https://image.ibb.co/gsF8Ob/gary_1.jpg",
    "latest_timestamp": "Sunday",
    "lastChat": "Whatever works for you!"
  },
  {
    "id": 13,
    "name": "Zoey",
    "picture": "https://image.ibb.co/nd0Wbw/zoey_1.jpg",
    "latest_timestamp": "8/12/2017",
    "lastChat": "Will get in touch"
  },
  {
    "id": 14,
    "name": "Ash",
    "picture": "https://image.ibb.co/iasYpG/ash_1.jpg",
    "latest_timestamp": "6/12/2017",
    "lastChat": "Ok"
  },
  {
    "id": 15,
    "name": "Zen",
    "picture": "https://image.ibb.co/eeqWbw/zen_1.jpg",
    "latest_timestamp": "19/11/2017",
    "lastChat": "Lol"
  },
  {
    "id": 16,
    "name": "Avy",
    "picture":
        "https://media.licdn.com/dms/image/D4D03AQGnxV3eRjNu1g/profile-displayphoto-shrink_800_800/0/1703592629183?e=2147483647&v=beta&t=ZU6D9dWLPXEz94GmoVORl79FwmqB4NToYmBAQ63qkdg",
    "latest_timestamp": "19/11/2019",
    "lastChat": "Ohh!"
  },
];

class CardDemo extends StatefulWidget {
  const CardDemo({super.key, required this.index});
  final int index;

  @override
  State<CardDemo> createState() {
    return _CardDemoState();
  }
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scrollable(
      // dragStartBehavior: DragStartBehavior.start,
      physics: const ClampingScrollPhysics(),
      viewportBuilder: (BuildContext context, ViewportOffset position) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.white,
          ),

          // alignment: Alignment.center,
          // padding: const EdgeInsets.all(0),
          // height: 40,
          width: 500,
          margin: EdgeInsets.all(1),
          child: Row(
            children: [
              CircleAvatar(
                foregroundImage: NetworkImage(list[widget.index]['picture']),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      list[widget.index]['name'],
                      style: const TextStyle(
                        fontSize: 18, // Adjust font size as needed
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.done_all_rounded,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            list[widget.index]['lastChat'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
