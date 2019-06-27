import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './firestoreservice.dart';

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
  final _custNameController= TextEditingController();
  final _custEmailController= TextEditingController();
  final _custPhoneController= TextEditingController();

  String custname, custemail;
  FireStoreService fireserv;

  getCustName(custname) {
    this.custname = custname;
  }

  getCustEmail(custemail) {
    this.custemail = custemail;
  }

  String custphone;

  void getCustPhone(custphone) {
    this.custphone = custphone;
  }

  CreateData() {
    DocumentReference ds =
        Firestore.instance.collection("customerDB").document();
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
      key: _formKey,
      body: new SingleChildScrollView(
        child: new Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  //controller:_custNameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "Name not exceeding 30 characters",
                    labelText: "Name",
                  ),
               onChanged: (String name) {
                    getCustName(name);
                  },
                ),
                TextField(
                  //controller:_custEmailController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "Valid email including @",
                    labelText: "email",
                  ),
                  onChanged: (String email) {
                    getCustEmail(email);
                  },
                ),
                TextField(
                  //controller:_custPhoneController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "10 digit",
                    labelText: "Phone",
                  ),

                  onChanged: (String phone) {
                    getCustPhone(phone);
                  },
                ),
                Center(
                    //padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        //fireserv.createNewcust(_custNameController.text, _custEmailController.text, _custPhoneController.text);
                        CreateData();
                        //if (_formKey.currentState.validate()) {
                          // If the form is valid, we want to show a Snackbar
                          //Scaffold.of(context).showSnackBar(
                            //  SnackBar(content:
                        Text('Processing Data');
                        Navigator.of(context).pop();
                      },
                      child: Text('Submit'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        print("cancelled");
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                )),
              ]),
        ),
      ),
    ),);
  }
}
