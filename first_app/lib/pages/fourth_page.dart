import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C', 'D', 'F', 'G', 'H', 'I', 'J', 'K', 'L'];
    final List<int> coloeCodes = <int>[600, 500, 100];

    return Scaffold(
      appBar: AppBar(
        title: Text('Listview Exaple'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(8.0),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            color: Colors.amber[coloeCodes[index % 3]],
            child: Center(
              child: Text('Entry ${entries[index]}'),
            ),
          );
        },
        separatorBuilder: (context, index) =>Divider(),
      ),
    );
  }
}