import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/controller/model/users_model.dart';
import '../controller/model/pet_model.dart';

class wishlist with ChangeNotifier {
  Map<String, Pet> _wishlist = {};

  Map<String, Pet> get getwishlist {
    return _wishlist;
  }

  final userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> fetchwishlist() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot userDoc = await userCollection.doc(user!.uid).get();
    if (userDoc.exists) {
      return;
    }
    final leng = userDoc
        .get('userWish')
        .length;
    for (int i = 0; i < leng; i++) {
      _wishlist.putIfAbsent(userDoc.get('userWish')[i]['cataddId'],
              () =>
              pet_model(
                  id: userDoc.get('userWish')[i]['wishListId'],
                  cataddId: userDoc.get('userWish')[i]['cataddId']
              ));
    }
    notifyListeners();
  }

  Future<void> removeOneItem({
    required String wishlistId,
    required String cataddId,
  }) async {
    final User? user = FirebaseAuth.instance.currentUser;
    await userCollection.doc(user!.uid).update({
      'userWish': FieldValue.arrayRemove([
        {
          'wishlistId': wishlistId,
          'cataddId': cataddId,
        }
      ])
    });
    _wishlist.remove(cataddId);
    await fetchwishlist();
    notifyListeners();
  }

  Future<void> clearOnlinewishlist() async {
    final User? user = FirebaseAuth.instance.currentUser;
    await userCollection.doc(user!.uid).update({
      'userWish': [],
    });
    _wishlist.clear();
    notifyListeners();
  }

  void clearLocalwishlist() {
    _wishlist.clear();
    notifyListeners();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Favourite'),
  //     ),
  //     body: Center(
  //       child: Text('Your Favourite items will be displayed here.'),
  //     ),
  //   );
  //   }
}
