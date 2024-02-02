import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Pet {
  final String? id;
  final String? name;
  final String? price;
  final dynamic age;
  final String? imageLink;
  final String? category;
  final String? description;
  bool isFavorite;

  Pet({
    required this.id,
    required this.name,
    required this.price,
    required this.age,
    required this.imageLink,
    required this.category,
    required this.description,
    this.isFavorite = false,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'] ,
      name: json['name'],
      price: json['price'],
      age: json['age'],
      imageLink: json['imageLink'],
      category: json['category'],
      description: json['description'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'age': age,
      'imageLink': imageLink,
      'category': category,
      'description': description,
      'isFavorite': isFavorite,
    };
  }
}
class DataController extends GetxController {
  RxList<Pet> petDataList = <Pet>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch pet data when the controller is initialized
    fetchPetDataFromFirestore();
  }

  Future<List<Pet>> fetchPetDataFromFirestore() async {
    // Fetch data from Firestore and create a list of Pet objects
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('catadd').get();

    List<Pet> petList = querySnapshot.docs.map((doc) {
      return Pet.fromJson({
        ...doc.data() as Map<String, dynamic>,
        'id': doc.id,
      });
    }).toList();

    petDataList.value = petList;
    update();
    return petList;
  }

  void toggleFavoriteStatus(Pet pet) {
    pet.isFavorite = !pet.isFavorite;
    update();
  }
}