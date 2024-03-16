import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SentMessage extends StatelessWidget {
  const SentMessage(
      {super.key,
      required this.message,
      required this.messageTime,
      this.isSent = 0});
  final String messageTime;
  final int isSent;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            (isSent == 1) ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: (isSent == 1) ? Color(0xffDCF7C5) : Color(0xfffafafa),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message,
                  style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Text(
                  messageTime,
                  style: GoogleFonts.openSans(
                      fontSize: 11, color: Color.fromRGBO(0, 0, 0, 0.25)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
