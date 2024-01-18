import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet/pages/utils.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const PetAdd(title: 'Add Pet'));
}
class PetAdd extends StatelessWidget {
  const PetAdd({Key? key, required String title});

  String? get title => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Pet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PetAdd(title: 'Add Pet'),
    );
  }
}

class Pet_Add extends StatefulWidget {

  const Pet_Add({Key? key, required this.title});

  final String title;

  @override
  State<Pet_Add> createState() => _PetAddState();
}

class _PetAddState extends State<Pet_Add> {
  Uint8List? _image;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String? selectedAge ;
  List<String> ageList =['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','more'];

  void selectImage() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }
  void _handleAddButton() {
    print('Name: ${nameController.text}');
    print('Age: $selectedAge');
    print('Price: ${priceController.text}');
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                  backgroundImage: NetworkImage('Z:\Intern-PetApp-main\assets\images\png\avatar-pet.png'),
                ),
                Positioned(child: IconButton(onPressed: selectImage,
                  icon: Icon(Icons.add_a_photo),),
                bottom:  -10,
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
              child: TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(onPressed: _handleAddButton, child: Text('Add'),),
          ],
        ),
      ),
    );
  }
}