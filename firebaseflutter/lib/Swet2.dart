import 'package:flutter/material.dart';



class Customer extends StatefulWidget {
  //  Customer({Key key}) : super(key: key);
  @override
  _CustomerState createState()=> new _CustomerState();
}

class _CustomerState extends State<Customer> {
//  _formKey and _autoValidate
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name;
  String _email;
  String _mobile;

  get _validateInputs => null;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Form Validation'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: FormUI(),
            ),
          ),
        );

  //  );
  }
  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Name'),
          keyboardType: TextInputType.text,
          validator: validateName,
          onSaved: (String val) {
            _name = val;
          },
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Mobile'),
          keyboardType: TextInputType.phone,
          validator: validateMobile,
          onSaved: (String val) {
            _mobile = val;
          },
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Email'),
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
          onSaved: (String val) {
            _email = val;
          },
        ),
        new SizedBox(
          height: 10.0,
        ),
        new RaisedButton(
          onPressed: _validateInputs,
          child: new Text('Validate'),
        )
      ],
    );
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}
