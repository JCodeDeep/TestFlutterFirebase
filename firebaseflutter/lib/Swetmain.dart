/*
import 'package:flutter/material.dart';
import './Swetmain.dart';
void main(List<String> args) {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends  State<MyApp>{
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: new AppBar(title: Text("Home Page"),
      backgroundColor: Colors.green[700] ,
    ),
        backgroundColor: Colors.green[100],
        body:Container(
            padding: EdgeInsets.all(30.0),
            child: GridView.count(
              crossAxisCount: 2 ,
              children: <Widget>[
                MyMenu(title: "Customer",icon: Icons.people, warna: Colors.blue,),
                //   MyMenu(title: "Lot",icon: Icons.timer, warna: Colors.brown,),
                //  MyMenu(title: "Payment",icon: Icons.monetization_on , warna: Colors.orange,),
                //  MyMenu(title: "Reward",icon: Icons.card_giftcard, warna: Colors.red,),
              ],)
        )
    );
  }
}
class MyMenu extends StatelessWidget{
  MyMenu({this.title, this.icon, this.warna});

  final String title;
  final IconData icon;
  final MaterialColor warna;
  @override
  Widget build(BuildContext context){
    return  Card(child: InkWell(
        onTap: (){
          Customer();
          print("hi");
        },
        splashColor: Colors.red,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 100.0,
                color: warna,
              ),
              Text(title,style:new TextStyle(fontSize: 17.0))
            ],
          ),
        )
    ),
    );

  }
}

*/