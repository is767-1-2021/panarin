import 'package:final_app/pages/history.dart';
import 'package:final_app/provider/calculator_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CalculatorButton extends StatefulWidget {
  final String label;
  final bool isColored, isEqualSign, canBeFirst;
  const CalculatorButton(
    this.label, {
    this.isColored = false,
    this.isEqualSign = false,
    this.canBeFirst = true,
    Key? key,
  }) : super(key: key);

  @override
  _CalculatorButtonState createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  @override
  Widget build(BuildContext context) {
    final calculatorProvider =
        Provider.of<CalculatorProvider>(context, listen: false);
    final TextStyle? textStyle = Theme.of(context).textTheme.headline6;
    final mediaQuery = MediaQuery.of(context).size;
    return Material(
      color: buttonsBackgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () {
          calculatorProvider.addToEquation(
            widget.label,
            widget.canBeFirst,
            context,
          );
        },
        child: Center(
          child: widget.isEqualSign
              ? Container(
                  height: mediaQuery.width * 0.1,
                  width: mediaQuery.width * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: yellowColor,
                  ),
                  child: Center(
                    child: Text(
                      widget.label,
                      style: textStyle?.copyWith(color: buttonsBackgroundColor),
                    ),
                  ),
                )
              : Text(
                  widget.label,
                  style: textStyle?.copyWith(
                      color: widget.isColored ? yellowColor : Colors.white),
                ),
        ),
      ),
    );
  }
}

void showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 400),
    ),
  );
}

List<CalculatorButton> buttons = <CalculatorButton>[
  CalculatorButton('AC', canBeFirst: false),
  CalculatorButton('C', canBeFirst: false),
  CalculatorButton('⌫', canBeFirst: false),
  CalculatorButton(' ÷ ', isColored: true, canBeFirst: false),
  CalculatorButton('7'),
  CalculatorButton('8'),
  CalculatorButton('9'),
  CalculatorButton(' × ', isColored: true, canBeFirst: false),
  CalculatorButton('4'),
  CalculatorButton('5'),
  CalculatorButton('6'),
  CalculatorButton(' - ', isColored: true, canBeFirst: false),
  CalculatorButton('1'),
  CalculatorButton('2'),
  CalculatorButton('3'),
  CalculatorButton(' + ', isColored: true, canBeFirst: false),
  CalculatorButton('00'),
  CalculatorButton('0'),
  CalculatorButton('.', canBeFirst: false),
  CalculatorButton('=', isEqualSign: true, canBeFirst: false),
];


class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => History(),
                ),
              );
            },
          icon: Icon(Icons.history)
          ),
        ],
      ),

      body : 
      Column(
        children: [
          Container(
            width: mediaQuery.width,
            height: mediaQuery.height * .3,
            padding: EdgeInsets.symmetric(
              vertical: mediaQuery.width * 0.08,
              horizontal: mediaQuery.width * 0.06,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 20.0,
                  child: ListView(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Consumer<CalculatorProvider>(
                        builder: (context, equation, child) => Text(
                          equation.equation,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Consumer<CalculatorProvider>(
                  builder: (context, equation, child) => Text(
                    equation.result,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: buttonsBackgroundColor,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(15.0),
                crossAxisSpacing: 5.0,
                childAspectRatio: 1.3,
                mainAxisSpacing: 5.0,
                crossAxisCount: 4,
                children: buttons,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
