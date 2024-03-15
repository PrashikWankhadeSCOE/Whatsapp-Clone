import "dart:typed_data";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/painting.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl_phone_field2/countries.dart";
import "package:intl_phone_field2/intl_phone_field.dart";

class Authorization extends StatefulWidget {
  const Authorization({super.key});

  @override
  State createState() => _AuthorizationState();
}

class _AuthorizationState extends State {
  TextEditingController numController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Text(
            "Done",
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
                height: 0,
                color: Color.fromRGBO(209, 209, 214, 1),
              ),
            ),
          ),
        ],
        title: Text(
          "PhoneNumber",
          style: GoogleFonts.jost(
            textStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: Center(
              child: Text(
                "Please confirm your country code and enter your phone number ",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25),
            height: 44,
            width: 375,
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: Row(
              children: [
                Text(
                  "India",
                  style: GoogleFonts.jost(
                    textStyle: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 122, 255, 1),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                    child: const Icon(Icons.arrow_forward_ios_outlined))
              ],
            ),
          ),
          Row(
            children: [
              Container(
                  // margin: const EdgeInsets.only(top: 10),
                  // padding: const EdgeInsets.only(top: 5, left: 15),
                  // height: 45,
                  // width: 70,
                  // color: Colors.white,
                  // child: Text(
                  //   "+1",
                  //   style: GoogleFonts.quando(
                  //     textStyle: const TextStyle(
                  //       fontSize: 27,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //   ),
                  // ),
                  ),
              // const  SizedBox(
              //   height: 10,
              //   child:
              // ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),

                  width: 1,
                  color: Colors.white,
                  // child: const TextField(
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //         width: 2,
                  //       ),
                  //     ),
                  //     hintText: "phone number",
                  //   ),
                  // ),
                  child: IntlPhoneField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(1),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
