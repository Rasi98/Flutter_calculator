import 'package:calculator_app/button.dart';
import 'package:flutter/material.dart';

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
  var userquestion = "";
  var useranswer = "";

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
                      if (index == 0) {
                        return Mybutton(
                          buttunTaped: () {
                            setState(() {
                              userquestion = "";
                            });
                          },
                          buttontext: buttons[index],
                          color: Colors.blueGrey[100],
                          textcolor: Colors.grey[850],
                        );
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
                      } else {
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

  bool isOperator(String x) {
    if (x == "%" || x == "x" || x == "/" || x == "-" || x == "+" || x == "=") {
      return true;
    }
    return false;
  }
}
