import 'package:flutter/material.dart';
import 'drawerScreen.dart';
import 'home_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            HomeScreen()

          ],
        ),

      );
    }
}