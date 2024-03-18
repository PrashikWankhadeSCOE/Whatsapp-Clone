import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_slidable/flutter_slidable.dart";

import "database/database_connection.dart";

List<Map<String, dynamic>> list = [];

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
      physics: const ClampingScrollPhysics(
        parent: ScrollPhysics(),
      ),
      viewportBuilder: (BuildContext context, ViewportOffset position) {
        return Slidable(
          endActionPane: ActionPane(motion: const ScrollMotion(), children: [
            SlidableAction(
              autoClose: true,
              onPressed: (BuildContext context) {
                setState(() {
                  deleteContact(widget.index);
                });
              },
              icon: Icons.delete,
              label: 'Delete',
            )
          ]),
          child: Container(
            height: 65,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(3),
              ),
              color: Colors.white,
            ),

            alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
            // height: 40,
            width: 500,
            margin: const EdgeInsets.all(1),
            child: Scrollable(
              physics: const ClampingScrollPhysics(
                parent: ScrollPhysics(),
              ),
              viewportBuilder: (BuildContext context, ViewportOffset position) {
                return Row(
                  children: [
                    CircleAvatar(
                      foregroundImage:
                          NetworkImage(list[widget.index]['picture']),
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
                );
              },
            ),
          ),
        );
      },
    );
  }
}
