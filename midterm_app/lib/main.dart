import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:provider/provider.dart';
import 'package:midterm_app/models/question_form_model.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/answer_page.dart';
import 'pages/booking_page.dart';
import 'pages/home_page.dart';
import 'pages/item_page.dart';
import 'pages/one_card_page.dart';
import 'pages/question_page.dart';
import 'pages/seamsee_page.dart';
import 'pages/temple_page.dart';
import 'pages/three_card_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ 
        ChangeNotifierProvider(
          create: (context) => QuestionFormmodel(),
          ),
        ],
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HamTarot',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF8E1),
        primarySwatch: Colors.brown,
        backgroundColor: Colors.amber.shade50,
        
        textTheme: GoogleFonts.promptTextTheme(
            Theme.of(context).textTheme,
      ),
      ),
      initialRoute: '/Home',
      routes: <String, WidgetBuilder> {
        '/Home': (context) => HomePage(),
        '/Q': (context) => QuestionPage(),
        '/A': (context) => AnswerPage(),
        '/Item': (context) => ItemPage(),
        '/1': (context) => OneCardPage(),
        '/3': (context) => ThreeCardPage(),
        '/Book': (context) => BookingPage(),
        '/SS': (context) => SeamseePage(),
        '/Tem': (context) => TemplePage(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
