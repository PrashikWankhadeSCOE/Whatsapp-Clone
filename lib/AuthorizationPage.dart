import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl_phone_field2/intl_phone_field.dart";
import "package:whatsappdemo/chats.dart";

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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WhatsappChats(),
                        ),
                      );
                    },
                    child: const Icon(Icons.arrow_forward_ios_outlined))
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: Center(
                    child: IntlPhoneField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              // width: 1,
                              ),
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
