import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/components/app_text_style.dart';
import 'package:pet/configuration/configuration.dart';
import 'package:pet/pages/main_home_page.dart';
import '../controller/model/pet_model.dart';
import 'home_screen.dart';



class DescriptionScreen extends StatefulWidget {
  //database
  final Pet pet;
  DescriptionScreen({required this.pet});
  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    Pet pet = widget.dataController.petDataList.firstWhere(
          (pet) => pet.id == widget.petId,
      orElse: () => Pet(), // Provide a default value or handle not found
    );
    return SafeArea(
        child: Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.blueGrey[300],
                            child: Image.network(
                              widget.pet.imageLink.toString(),
                              height: 300,
                              width: Get.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Text(
                                        widget.pet.description.toString(),
                                        style: AppTextStyle.normalRegular16
                                            .copyWith(color: primaryColor),
                                      ),
                                    ),
                                  ),
                                ])
                              ]),
                        ),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        IconButton(icon: Icon(Icons.share), onPressed: () {})
                      ],
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 40),
                //   child: Align(
                //     alignment: Alignment.topCenter,
                //     child: Hero(
                //         tag: 1,
                //         child: Image.network(widget.pet.imageLink.toString(),height: 300,width: Get.width,fit: BoxFit.cover,)),
                //
                //   ),
                // ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 120,
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: shadowList,
                        borderRadius: BorderRadius.circular(20)),

                    //database
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.pet.name.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32.0,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.female_rounded,
                              color: Colors.grey[600],
                            ),
                          ],
                        ),
                        Text(
                          widget.pet.age + ' years old',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          widget.pet.price.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 100,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                            // Simulate loading delay
                            Future.delayed(Duration(seconds: 2), () {
                              // Close loader
                              Get.back();
                              // Update favorite state
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                              // Redirect to home page
                              Get.offAll(
                                  HomePage()); // Change 'HomePage()' to your home page class
                            });
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.green[900],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.green[900],
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text('Adoption',
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 24)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ),
        );
    }
}
