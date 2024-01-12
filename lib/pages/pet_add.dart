import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet/pages/utils.dart';

void main() {
  runApp(const PetAdd(title: 'Add Pet',));
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
  void selectImage() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    _image = img
  }
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
                CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage('Z:\Intern-PetApp-main\assets\images\png\avatar-pet.png'),
                ),
                Positioned(child: IconButton(onPressed: selectImage,
                  icon: Icon(Icons.add_a_photo),),
                bottom:  -10,
                  left: 80,
                )

              ],
            )
          ],
        ),
      ),

    );
  }
}