import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import './customerdetail.dart';
//import './customerform.dart';
import './addNewCustomer.dart';

class customerlist extends StatefulWidget {
  @override
  _customerlistState createState() {
    // TODO: implement createState
    return _customerlistState();
  }
}

class _customerlistState extends State<customerlist> {
  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('customerDB').getDocuments();
    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => custdetail(
                  post: post,
                )));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Customers"),),
      body: Container(
        padding: EdgeInsets.only(left: 15.0, top: 50.0, right: 30.0),
        child: FutureBuilder(
          future: getPosts(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("loading..."),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].data["customerName"]),
                      onTap: () => navigateToDetail(snapshot.data[index]),
                    );
                  });
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyCustomForm()));
          print("pressed");
        },
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
    );
  }
}
