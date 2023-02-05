import 'package:flutter/material.dart';

Widget chatBubble() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(Icons.person),
      ),
      SizedBox(width: 5,),

      Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), 
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)
          ),
          color: Colors.blue.shade200
        ),
        child: Text("Hey how are you", style: TextStyle(fontSize: 20),),
      )

    ],
  );
}
