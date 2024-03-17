import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SentMessage extends StatelessWidget {
  const SentMessage(
      {super.key,
      required this.message,
      required this.messageTime,
      required this.len,
      this.isSent = 0});
  final String messageTime;
  final int isSent;
  final String message;
  final int len;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (isSent == 1)
          ? const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 40)
          : const EdgeInsets.only(top: 8, bottom: 8, right: 40, left: 8),
      child: Row(
        mainAxisAlignment:
            (isSent == 1) ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          (len > 45)
              ? Expanded(
                  child: messageCard(),
                )
              : messageCard()
        ],
      ),
    );
  }

  Container messageCard() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color:
              (isSent == 1) ? const Color(0xffDCF7C5) : const Color(0xfffafafa),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            message,
            style: GoogleFonts.openSans(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          Text(
            messageTime,
            style: GoogleFonts.openSans(
                fontSize: 11, color: const Color.fromRGBO(0, 0, 0, 0.25)),
          )
        ],
      ),
    );
  }
}
