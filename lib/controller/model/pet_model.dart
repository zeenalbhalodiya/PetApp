
class Pet {
  final String? id;
  final String? name;
  final String? price;
  final dynamic age;
  final String? imageLink;
  final String? category;
  final String? description;

  Pet({
    required this.id,
    required this.name,
    required this.price,
    required this.age,
    required this.imageLink,
    required this.category,
    required this.description,
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
    };
  }
}