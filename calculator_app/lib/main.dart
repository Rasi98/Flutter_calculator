import 'package:calculator_app/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //variables to store user inputs and answer
  var userquestion = "";
  var useranswer = "";

  //Button list
  final List<String> buttons = [
    "C",
    "Del",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    ".",
    "Ans",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userquestion,
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      useranswer,
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      
                      //Clear button
                      if (index == 0) {
                        return Mybutton(
                          buttunTaped: () {
                            setState(() {
                              userquestion = "";
                              useranswer = "";
                            });
                          },
                          buttontext: buttons[index],
                          color: Colors.blueGrey[100],
                          textcolor: Colors.grey[850],
                        );
                        
                        //Delete button
                      } else if (index == 1) {
                        return Mybutton(
                          buttunTaped: () {
                            setState(() {
                              userquestion = userquestion.substring(
                                  0, userquestion.length - 1);
                            });
                          },
                          buttontext: buttons[index],
                          color: Colors.blueGrey[300],
                          textcolor: Colors.grey[850],
                        );
                        
                        // Equel button
                      } else if (index == buttons.length - 1) {
                        return Mybutton(
                          buttunTaped: () {
                            setState(() {
                              equalMethod();
                            });
                          },
                          buttontext: buttons[index],
                          color: Colors.grey[850],
                          textcolor: Colors.grey[350],
                        );
                       
                        //Answer button
                      } else if (index == buttons.length - 2) {
                        return Mybutton(
                          buttunTaped: () {
                            setState(() {
                              equalMethod();
                            });
                          },
                          buttontext: buttons[index],
                          color: Colors.grey[350],
                          textcolor: Colors.grey[850],
                        );
                      }
                      
                      //Colored functional buttons
                      else {
                        return Mybutton(
                          buttunTaped: () {
                            setState(() {
                              userquestion += buttons[index];
                            });
                          },
                          buttontext: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.grey[850]
                              : Colors.grey[350],
                          textcolor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.grey[850],
                        );
                      }
                    })),
          ),
        ],
      ),
    );
  }

  //Return true if the button is a one of {%,x,/,-,+}
  bool isOperator(String x) {
    if (x == "%" || x == "x" || x == "/" || x == "-" || x == "+" || x == "=") {
      return true;
    }
    return false;
  }

  //calculation using math_expression 
  void equalMethod() {
    String finaluserinput = userquestion;
    finaluserinput = finaluserinput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    useranswer = eval.toString();
  }
}
