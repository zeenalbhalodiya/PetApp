import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'model/pet_model.dart';

class DataController extends  GetxController{
  RxList<Pet> petDataList = <Pet>[].obs;
  List<String> favoritePetIds = [];

  @override
  void onInit() {
    super.onInit();
    // Fetch pet data when the controller is initialized
    fetchPetDataFromFirestore();
  }

  Future<List<Pet>> fetchPetDataFromFirestore() async {
    // Fetch data from Firestore and create a list of Pet objects
    // Assume 'catadd' is the collection name in Firestore

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('catadd').get();

    bool isPetFavorite(String petId) {
      return favoritePetIds.contains(petId);
    }
    List<Pet> petList = querySnapshot.docs.map((doc) {
      // Fetch image URL using fetchImageUrl function
      return Pet.fromJson({
        ...doc.data() as Map<String, dynamic>,
        'id': doc.id,
      });
    }).toList();
    petDataList.value = petList;
    update();
    // log("----fetchPetDataFromFirestore----");
    // log("----petList----" + petList.length.toString());


    return petList;
  }
  bool isPetFavorite(String petId) {
    return favoritePetIds.contains(petId);
  }
  void toggleFavoriteStatus(String petId) {
    if (isPetFavorite(petId)) {
      favoritePetIds.remove(petId);
    } else {
      favoritePetIds.add(petId);
    }
    update();
  }
}