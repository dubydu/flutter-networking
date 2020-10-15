import 'package:flutter/material.dart';

class BlueReviewController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Blue',
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          color: Colors.white,
        )
    );
  }
}