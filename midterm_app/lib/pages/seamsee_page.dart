import 'package:flutter/material.dart';

class SeamseePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seamsee Page'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('เสี่ยงเซียมซี'),
          ],
        ),
      ),

    );
  }
}