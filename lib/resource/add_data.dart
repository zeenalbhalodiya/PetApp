import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData{
  get imageUrl => null;


  Future<String> uploadImageToStorage(String childName, Uint8List file) async{
  Reference ref = _storage.ref().child(childName).child(file.length.toString());  
  UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData(
      {required String name, required String age, required String price, required Uint8List file,}) async {
    String resp = "Some Error Occurred";
    try{
      int ageValue = int.parse(age);
      int priceValue = int.parse(price);

      if (name.isNotEmpty && ageValue >= 0 && priceValue >= 0) {
        String imageUrl = await uploadImageToStorage('catadd', file);
        await _firestore.collection('catadd').add({
          'name': name,
          'age': age,
          'price': price,
          'imageLink': imageUrl,
        });
        resp = 'success';
      }
    }
        catch(err){
          resp =err.toString();
        }
        return resp;
  }
}