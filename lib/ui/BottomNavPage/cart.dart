import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users-cart-items")
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .collection("items")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("SomeThing IS Wrong"),
                  );
                }
                return ListView.builder(
                    itemCount:
                        snapshot.data == null ? 0 : snapshot.data!.docs.length,
                    itemBuilder: (_, index) {
                      DocumentSnapshot _documentSnapshot =
                          snapshot.data!.docs[index];
                      return ListTile(
                        leading: Text(_documentSnapshot['name']),
                        title: Text(
                          "\$ ${_documentSnapshot['price']}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                        trailing: GestureDetector(
                          child: CircleAvatar(
                            child: Icon(Icons.remove_circle),
                          ),
                          onTap: () {
                            FirebaseFirestore.instance
                                .collection("users-cart-items")
                                .doc(FirebaseAuth.instance.currentUser!.email)
                                .collection("items")
                                .doc(_documentSnapshot.id)
                                .delete();
                          },
                        ),
                      );
                    });
              })),
    );
  }
}
