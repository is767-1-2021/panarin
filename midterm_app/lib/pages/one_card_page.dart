import 'package:flutter/material.dart';

class OneCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('One Card Page'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('เปิดไพ่ 1 ใบ'),
          ],
        ),
      ),

    );
  }
}