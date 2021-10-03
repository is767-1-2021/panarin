import 'package:flutter/material.dart';

class TemplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temple Page'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ค้นหาวัดแก้ดวง'),
          ],
        ),
      ),

    );
  }
}