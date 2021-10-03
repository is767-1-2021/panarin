import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hamtarot'),
      ),

      body: GridView.count(
        crossAxisCount: 2 ,
        children: <Widget>[
          
          InkWell(
            onTap: () {
               Navigator.pushNamed(context, '/Q');
            },
            child: Container(
            margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.brown[600],
                  borderRadius: BorderRadius.circular(8.0),   
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.quiz, size: 60, color: Colors.white), 
                  Text('ไพ่คำถาม', style: TextStyle(fontSize: 18, color: Colors.white)),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: () {
               Navigator.pushNamed(context, '/Item');
            },
            child: Container(
            margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.brown[600],
                  borderRadius: BorderRadius.circular(8.0),   
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.redeem_rounded, size: 60, color: Colors.white), 
                  Text('บูชาวัตถุมงคล', style: TextStyle(fontSize: 18, color: Colors.white)),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: () {
               Navigator.pushNamed(context, '/1');
            },
            child: Container(
            margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.brown[600],
                  borderRadius: BorderRadius.circular(8.0),   
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.filter_1_rounded, size: 60, color: Colors.white), 
                  Text('ไพ่ 1 ใบ', style: TextStyle(fontSize: 18, color: Colors.white)),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: () {
               Navigator.pushNamed(context, '/3');
            },
            child: Container(
            margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.brown[600],
                  borderRadius: BorderRadius.circular(8.0),   
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.filter_3_rounded, size: 60, color: Colors.white), 
                  Text('ไพ่ 3 ใบ', style: TextStyle(fontSize: 18, color: Colors.white)),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: () {
               Navigator.pushNamed(context, '/SS');
            },
            child: Container(
            margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.brown[600],
                  borderRadius: BorderRadius.circular(8.0),   
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.battery_unknown, size: 60, color: Colors.white), 
                  Text('เซียมซี', style: TextStyle(fontSize: 18, color: Colors.white)),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: () {
               Navigator.pushNamed(context, '/Tem');
            },
            child: Container(
            margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.brown[600],
                  borderRadius: BorderRadius.circular(8.0),   
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 60, color: Colors.white), 
                  Text('ค้นหาวัด', style: TextStyle(fontSize: 18, color: Colors.white)),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: () {
               Navigator.pushNamed(context, '/Book');
            },
            child: Container(
            margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.brown[600],
                  borderRadius: BorderRadius.circular(8.0),   
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.date_range_rounded, size: 60, color: Colors.white), 
                  Text('จองคิวดูดวง', style: TextStyle(fontSize: 18, color: Colors.white)),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}