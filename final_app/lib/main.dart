import 'package:final_app/provider/calculator_provider.dart';
import 'package:final_app/service/history_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'controller/history_controller.dart';
import 'pages/calculator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp();
  
  var services = HistoryServices();
  var controller = HistoryController(services);
  
  runApp(
    ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: MyApp(),
    ),

  );
}

const buttonsBackgroundColor = Color(0xFF090E1C);
const backgroundColor = Color(0xFF141A2F);
const yellowColor = Color(0xFFF7CF32);
const whiteColor = Colors.white;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorProvider>(
      create: (_) => CalculatorProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          brightness: Brightness.dark,
          accentColor: yellowColor,
          appBarTheme: AppBarTheme(
            color: backgroundColor,
            elevation: 0.0,
          ),
          textTheme: TextTheme(
            headline3: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            caption: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
              fontSize: 18.0,
            ),
          ),
        ),
        routes: {
        '/': (context) => Calculator(),
        },
      ),
    );
  }
}
