import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/components/colors.dart';
import 'package:pet/controller/authController.dart';

import '../configuration/configuration.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: appColor,
        padding: EdgeInsets.only(top:50,bottom: 70,left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // CircleAvatar(),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Miroslava Savitskaya',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20, height: 5),),
                    Text('Active Status',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20, height: -2))
                  ],
                )
              ],
            ),

            GestureDetector(
              onTap: (){
                print("----------test7777-------");

              },
              child: Column(
                children: drawerItems.map((element) => GestureDetector(

                  onTap: (){
                    print("----------test-------");
                    if(element['title'] == 'Logout'){
                      _showLogoutDialog(context);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Icon(element['icon'],color: Colors.white,size: 20,),
                        SizedBox(width: 15,),
                        Text(element['title'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                      ],

                    ),
                  ),
                )).toList(),
              ),
            ),

            Row(
              children: [
                Icon(Icons.settings,color: Colors.white),
                SizedBox(width: 10,height: 20,),
                Text('Settings',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(width: 10,height: 20,),
                // Container(width: 2,height: 20,color: Colors.white,),
                // SizedBox(width: 10,),
                // Text('Log out',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)


              ],

            )


          ],
        ),

        );
    }

  // Function to show the logout confirmation dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog and perform logout action
                // Navigator.of(context).pop();
                var controller = Get.put(AuthController());
                controller.signOut();
                // Add your logout logic here
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }
}

