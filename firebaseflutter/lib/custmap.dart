import 'package:flutter/material.dart';

class customerList{
  String _custname;
  String _custemail;
  String _custphone;

  customerList(this._custname,this._custemail,this._custphone);

  customerList.map(dynamic obj){
    this._custname = obj["customerName"];
    this._custemail = obj["customerEmail"];
    this._custphone = obj["customerPhone"];
  }
  String get custname=>_custname;
  String get custemail=>_custemail;
  String get custphone=>_custphone;

  Map<String, dynamic> toMap(){
    var map=new Map<String, dynamic>();
    map['customerName']=_custname;
    map['customerEmail']=_custemail;
    map['customerPhone']=_custphone;
    return map;
  }

  customerList.fromMap(Map<String, dynamic> map){
    this._custname=map['customerName'];
    this._custemail=map['customerEmail'];
    this._custphone=map['customerPhone'];
  }

}