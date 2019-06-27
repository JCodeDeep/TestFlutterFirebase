import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './firestoreservice.dart';
import 'dart:async';

// Create a Form Widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;
  String custname, custemail, custphone;
  FireStoreService fireserv;

  getCustName(custname) {
    this.custname = custname;
  }

  getCustEmail(custemail) {
    this.custemail = custemail;
  }

  void getCustPhone(custphone) {
    this.custphone = custphone;
  }

  CreateData() {
    DocumentReference ds =
        Firestore.instance.collection("customerDB").document();
    _formKey.currentState.save();
    Map<String, dynamic> cust = {
      "customerName": custname,
      "customerEmail": custemail,
      "customerPhone": custphone,
    };
    ds.setData(cust).whenComplete(() {
      print(custname);
      print(custemail);
      print(custphone);
      print("saved");
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        //key: _formKey,
        body: new SingleChildScrollView(
          child: new Container(
            margin: EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: FormUI(),
            ),
          ),
        ),
      ),
    );
  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          //controller:_custNameController,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: "Name not exceeding 30 characters",
            labelText: "Name",
          ),
          validator: (String value) {
            if (value.length < 3)
              return 'Name must be more than 2 charater';
            else
              return null;
          },
          onSaved: (String name) {
            custname=name;
          },
        ),
        new TextFormField(
          //controller:_custEmailController,
          decoration: const InputDecoration(
            icon: Icon(Icons.email),
            hintText: "Valid email including @",
            labelText: "email",
          ),
          validator: (String value) {
            Pattern pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regex = new RegExp(pattern);
            if (!regex.hasMatch(value))
              return 'Enter Valid Email';
            else
              return null;
          },
          onSaved: (String email) {
            getCustEmail(email);
          },
        ),
        new TextFormField(
          //controller:_custPhoneController,
          decoration: const InputDecoration(
            icon: Icon(Icons.phone),
            hintText: "10 digit",
            labelText: "Phone",
          ),
          validator: (String value) {
// Indian Mobile number are of 10 digit only
            if (value.length != 10)
              return 'Mobile Number must be of 10 digit';
            else
              return null;
          },
          onSaved: (String phone) {
            getCustPhone(phone);
          },
        ),
        new SizedBox(
          height: 15.0,
        ),
        new RaisedButton(
          onPressed: () {
           _validateInputs;
           // CreateData();
            Text('Processing Data');
            //Navigator.of(context).pop();
          },
          child: new Text("Submit"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
            print("cancelled");
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }

  void _validateInputs() {
    final form = _formKey.currentState;
    if (form.validate()) {
      // Text forms was validated.
      print(form);
      form.save();
      //CreateData();
    } else {
      print(form);
      setState(() => _autoValidate = true);
    }
  }
}
