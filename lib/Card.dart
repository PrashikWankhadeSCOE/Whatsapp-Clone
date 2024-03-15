// import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class ChatModelClass {
  final String name;
  final String lastChat;
  final String date;
  ChatModelClass(
      {required this.name, required this.lastChat, required this.date});
}

List<ChatModelClass> list = [
  ChatModelClass(
    name: 'Prashik',
    date: '14/03/24',
    lastChat: 'hello how are you',
  )
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
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            color: Colors.purple,
          ),
          height: 60,
          width: 60,
          child: Image.asset("asset/images/prashik.jpeg"),
        ),
        const SizedBox(
          width: 10,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(list[widget.index].name),
                const Row(
                  children: [
                    Icon(
                      Icons.done_all_rounded,
                      color: Colors.green,
                    ),
                    Row(
                      children: [
                        Text("What kind of strategy is better?"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
