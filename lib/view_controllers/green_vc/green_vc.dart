import 'package:flutter/material.dart';

class GreenReviewController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Green',
          ),
          backgroundColor: Colors.green,
        ),
        body: Container(
          color: Colors.white,
        )
    );
  }
}