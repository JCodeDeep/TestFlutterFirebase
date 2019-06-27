import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class custdetail extends StatefulWidget {
  final DocumentSnapshot post;

  custdetail({this.post});

  @override
  _custdetailState createState() {
    // TODO: implement createState
    return _custdetailState();
  }
}

class _custdetailState extends State<custdetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.data["customerName"],
            textAlign: TextAlign.center, style: TextStyle(fontSize: 40)),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30.0, top: 50.0, right: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Phone"),
            Text(
              widget.post.data["customerPhone"],
              style: TextStyle(fontSize: 20),
            ),
            Text("Email"),
            Text(widget.post.data["customerEmail"],
                style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
