import "dart:async";
import "package:cloud_firestore/cloud_firestore.dart";
import "./custmap.dart";

final CollectionReference myCollection = Firestore.instance.collection("customerDB");

class FireStoreService{

  Future<customerList> createNewcust(String custname, String custemail, String custphone) async{
    final TransactionHandler createTransaction= (Transaction tx) async{
      final DocumentSnapshot docsnap=await tx.get(myCollection.document());

      final customerList cdetail= customerList(custname, custemail, custphone);
      final Map<String, dynamic> data=cdetail.toMap();
      await tx.set(docsnap.reference, data);
      return data;
    };
    return Firestore.instance.runTransaction(createTransaction).then((mapData){
      return customerList.fromMap(mapData);
      }).catchError((onError){
      print ("error:$onError");
      return null;
    });
  }

  Stream<QuerySnapshot> getCustList({int offset, int limit}){
    Stream<QuerySnapshot> snapshots=myCollection.snapshots();
    if(offset!=null){
      snapshots=snapshots.skip(offset);
    }
    if(limit!=null){
      snapshots=snapshots.take(limit);
    }
    return snapshots;

  }
}