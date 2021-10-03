import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/models/question_form_model.dart';
import 'package:provider/provider.dart';
import 'question_page.dart';

class AnswerPage extends StatefulWidget {
  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  final number = Random().nextInt(3) + 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Answer Page'),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/Home');
          }, 
            icon: Icon(Icons.home)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [            
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Consumer<QuestionFormmodel>(
                builder: (context, form, child){
                  return Text('ผลการทำนายของคุณ ${form.name}');
                },
              ),
            ),

            number == 1 ? Container(
              child: Column(
                children: [
                  Text('ไพ่หนึ่งเหรียญ'),
                  Image.asset(
                    'assets/card_front1.png',
                      width: 200,
                      height: 330,  
                  ),
                  Consumer<QuestionFormmodel>(
                    builder: (context, form, child){
                    return Text('จากคำถาม ${form.question} ไพ่ขอทำนายว่า คุณต้องใช้ความพยายามอย่างมากสำหรับเรื่องนี้ บางทีความใจร้อนและด่วนตัดสินใจอาจจะไม่ใช่คำตอบ' );
                    },
                  ),
                ],
              ), 
            ) : SizedBox(),
            
            number == 2 ? Container(
              child: Column(
                children: [
                  Text('ไพ่สองเหรียญ'),
                  Image.asset(
                    'assets/card_front2.png',
                      width: 200,
                      height: 330,  
                  ),
                  Consumer<QuestionFormmodel>(
                    builder: (context, form, child){
                    return Text('จากคำถาม ${form.question} ไพ่ขอทำนายว่า คนใกล้ตัวจะเป็นผู้แก้ไขปัญหาหรือหยิบยื่นทางออกให้สำหรับเรื่องนี้');
                    },
                  ),
                ],
              ), 
            ) : SizedBox(),

            number == 3 ? Container(
              child: Column(
                children: [
                  Text('ไพ่สามเหรียญ'),
                  Image.asset(
                    'assets/card_front3.png',
                      width: 200,
                      height: 330,  
                  ),
                  Consumer<QuestionFormmodel>(
                    builder: (context, form, child){
                    return Text('จากคำถาม ${form.question} ไพ่ขอทำนายว่า เป็นจังหวะที่เหมาะสมกับการลงมือทำ');
                    },
                  ),
                ],
              ), 
            ) : SizedBox(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: (){
                      //code resetform ตอนย้อนกลับ
                      Navigator.pushAndRemoveUntil<QuestionForm>( //ชื่อคลาสฟอร์ม
                        context,
                          MaterialPageRoute<QuestionForm>(
                            builder: (BuildContext context) => QuestionPage(), //ชื่อคลาสเพจ
                          ),
                        (route) => false,
                      );
                    }, 
                    child: Text('ทำนายใหม่อีกครั้ง'),
                  ),
                  
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/Item');
                    }, 
                    child: Text('บูชาวัตถุมงคล'),
                  ),
                ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: SingleChildScrollView(
        child: CurvedNavigationBar(
          color: Color(0xFF6d4c41), 
          backgroundColor: Color(0xFFFFF8E1),
          buttonBackgroundColor: Color(0xFF6d4c41),
          height: 50,
          items: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/1');
                },
                icon: Icon(Icons.filter_1_rounded, size: 30, color: Colors.black)),

            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/3');
                },
                icon:
                    Icon(Icons.filter_3_rounded, size: 30, color: Colors.black)),

            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Q');
                },
                icon: Icon(Icons.quiz, size: 30, color: Colors.black)),

            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/SS');
                },
                icon: Icon(Icons.battery_unknown, size: 30, color: Colors.black)),

            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Book');
                },
                icon: Icon(Icons.date_range_rounded, size: 30, color: Colors.black)),
          ],
          animationDuration: Duration(milliseconds: 200),
          index: 2,
        ),
      ),
    );
  }
}

