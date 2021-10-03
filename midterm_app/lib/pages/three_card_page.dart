import 'package:flutter/material.dart';

class ThreeCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Three Card Page'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('เปิดไพ่ 3 ใบ'),
          ],
        ),
      ),

    );
  }
}