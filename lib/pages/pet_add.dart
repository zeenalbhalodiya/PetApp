import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet/pages/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pet/resource/add_data.dart';

import '../configuration/configuration.dart';

class PetAdd extends StatefulWidget {
  const PetAdd({Key? key});

  @override
  State<PetAdd> createState() => _PetAddState();
}

class _PetAddState extends State<PetAdd> {
  Uint8List? _image;

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String? selectedAge;
  String? selectedCategory;
  String? description;

  List<String> ageList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    'more'
  ];
  bool isLoading = false;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  Future _handleAddButton() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    String name = nameController.text;
    // int age = int.parse(ageController.text);
    // int price = int.parse(ageController.text);
    String age = selectedAge ?? '';
    String price = priceController.text;

    String resp = await StoreData().saveData(
        name: name,
        age: age,
        price: price,
        category: selectedCategory ?? '',
        description: description ?? '',
        file: _image!);
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pop();

    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Successfully added!'),
        duration: Duration(seconds: 2),
      ),
    );

    // Delay the navigation to give time for the user to see the success message
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the home page
      Navigator.of(context).pop(); // Close the current screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pet Add"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                            'Z:\Intern-PetApp-main\assets\images\png\avatar-pet.png'),
                      ),
                Positioned(
                  child: IconButton(
                    onPressed: selectImage,
                    icon: Icon(Icons.add_a_photo),
                  ),
                  bottom: -10,
                  left: 80,
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                value: selectedAge,
                onChanged: (String? value) {
                  setState(() {
                    selectedAge = value;
                  });
                },
                items: ageList
                    .map((age) => DropdownMenuItem<String>(
                          value: age,
                          child: Text(age),
                        ))
                    .toList(),
                decoration: InputDecoration(labelText: 'Age'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                value: selectedCategory,
                onChanged: (String? value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
                items: categories
                    .map((category) => DropdownMenuItem<String>(
                          value: category['name'],
                          child: Text(category['name']),
                        ))
                    .toList(),
                decoration: InputDecoration(labelText: 'Category'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _handleAddButton,
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
