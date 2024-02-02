import 'package:flutter/material.dart';

class wishlist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
      ),
      body: Center(
        child: Text('Your Favourite items will be displayed here.'),
      ),
    );
    }
}
