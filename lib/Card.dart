// import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
// import "package:google_fonts/google_fonts.dart";

// class CardDemo extends StatefulWidget {
//   const CardDemo({super.key});

//   @override
//   State createState() {
//     return _CardDemoState();
//   }
// }

// class _CardDemoState extends State {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   title: Text(
//       //     "Abhay Patil",
//       //     style: GoogleFonts.openSans(
//       //       textStyle: const TextStyle(
//       //         fontSize: 16,
//       //         fontWeight: FontWeight.w600,
//       //       ),
//       //     ),
//       //   ),
//       // ),,

//       body: Row(
//         children: [
//           const SizedBox(
//             height: 10,
//           ),
//           Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: 20),
//                 padding: EdgeInsets.all(10),
//                 height: 100,

//                 width: 100,
//                 // color: Colors.red,
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(50)),
//                   color: Colors.red,
//                 ),
//                 child: Image.asset(
//                   "asset/images/profile.jpeg",
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           Column(
//             children: [
//               Text(
//                 "Abhay Patil",
//                 style: GoogleFonts.openSans(
//                   textStyle: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CardDemo extends StatefulWidget {
//   const CardDemo({super.key});

//   @override
//   State createState() {
//     return _CardDemoState();
//   }
// }

// class _CardDemoState extends State {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           // const SizedBox(
//           //   height: 2,
//           // ),
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(40),
//               ),
//               color: Colors.red,
//             ),
//             height: 100,
//             width: 100,
//             child: Image.asset("asset/images/profile.jpeg"),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 "Abhay Patil",
//                 style: GoogleFonts.openSans(
//                   textStyle: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               const Text("10-3-24"),
//               Column(
//                 children: [
//                   Text(
//                     "What kind of strategy is better?",
//                     style: GoogleFonts.openSans(
//                       textStyle: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
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
