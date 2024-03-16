import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'messages/messages.dart';

List<Map> messageList = [
  {
    'message': 'Do you know what time it is ?',
    'messageTime': '11:40',
    'isSent': 1
  },
  {
    'message': 'Yes its a sunny morning here',
    'messageTime': '11:40',
    'isSent': 0
  }
];

class Chats extends StatefulWidget {
  const Chats({super.key, required this.name, required this.imageurl});
  final String imageurl;
  final String name;

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: ChatAppBar(widget: widget),
          ),
          Expanded(
            child: Container(
              // width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'asset/images/chatbg.png',
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: messageList.length,
                      itemBuilder: (BuildContext context, index) {
                        return SentMessage(
                          message: messageList[index]['message'],
                          messageTime: messageList[index]['messageTime'],
                          isSent: messageList[index]['isSent'],
                        );
                      }),
                  const SentMessage(
                    message: 'Do you know what time it is ?',
                    messageTime: '11:40',
                    // isSent: 0,
                  ),
                  const SentMessage(
                    message: 'Yes its a sunny morning here',
                    messageTime: '11:40',
                    isSent: 1,
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.add,
                            color: Color(0xff007AFF),
                            size: 30,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                          width: 0.5,
                                          color: Color(0xff8E8E93),
                                        ),
                                      ),
                                      suffixIcon: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: const Icon(
                                              Icons.call_received,
                                              color: Color(0xff007AFF),
                                              size: 30,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: const Icon(
                                              Icons.send,
                                              color: Color(0xff007AFF),
                                              size: 30,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xff007AFF),
                            size: 30,
                          ),
                          const Icon(
                            Icons.mic_none_outlined,
                            color: Color(0xff007AFF),
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({
    super.key,
    required this.widget,
  });

  final Chats widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff007AFF),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
          foregroundImage: NetworkImage(widget.imageurl),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: GoogleFonts.jost(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: const Color(0xff000000),
              ),
            ),
            Text(
              'tap here for more info',
              style: GoogleFonts.jost(
                fontSize: 12,
                color: const Color(0xff8E8E93),
              ),
            ),
          ],
        ),
        const Spacer(),
        const Row(children: [
          Icon(
            Icons.videocam_outlined,
            size: 30,
            color: Color(0xff007AFF),
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.phone_outlined,
            size: 30,
            color: Color(0xff007AFF),
          ),
        ]),
      ],
    );
  }
}
