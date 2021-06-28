import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var result = "";

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  btn(var digit, var clr) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
            decoration: BoxDecoration(
                color: clr,
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.all(Radius.circular(60))),
            height: 75,
            width: 75,
            // color: Colors.blueAccent,
            child: Center(
                child: Text(
              digit,
              style: TextStyle(fontSize: 30),
            ))),
        onTap: () {
          setState(() {
            result = result + digit;
          });
        },
      ),
    );
  }

  btn_diff(var digit, var clr) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: clr,
              border: Border.all(color: Colors.lightBlue),
              borderRadius: BorderRadius.all(Radius.circular(60))),
          height: 75,
          width: 75,
          // color: Colors.blueAccent,
          child: Center(
              child: Text(
            digit,
            style: TextStyle(fontSize: 30),
          ))),
    );
  }

  long_btn(var digit, var clr) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
            decoration: BoxDecoration(
                color: clr,
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.all(Radius.circular(60))),
            height: 166,
            width: 75,
            // color: Colors.blueAccent,
            child: Center(
                child: Text(
              digit,
              style: TextStyle(fontSize: 30),
            ))),
        onTap: () {
          setState(() {
            result = result + digit;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Simple Calculator')),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 195,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 35),
                  child: Text(
                    result,
                    style: TextStyle(fontSize: 80),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        InkWell(
                          child: btn_diff('C', Colors.lightBlueAccent.shade400),
                          onTap: () {
                            setState(() {
                              result = '';
                            });
                          },
                        ),
                        btn('7', Colors.white),
                        btn('4', Colors.white),
                        btn('1', Colors.white),
                        btn('.', Colors.white)
                      ],
                    ),
                    Column(
                      children: [
                        btn('%', Colors.lightBlueAccent.shade400),
                        btn('8', Colors.white),
                        btn('5', Colors.white),
                        btn('2', Colors.white),
                        btn('0', Colors.white)
                      ],
                    ),
                    Column(
                      children: [
                        btn('/', Colors.lightBlueAccent.shade400),
                        btn('9', Colors.white),
                        btn('6', Colors.white),
                        btn('3', Colors.white),
                        btn('00', Colors.white)
                      ],
                    ),
                    Column(
                      children: [
                        btn('*', Colors.blue[600]),
                        btn('-', Colors.blue[600]),
                        long_btn('+', Colors.blue[600]),
                        InkWell(
                          child: btn_diff('=', Colors.blue[600]),
                          onTap: () {
                            setState(() {
                              output();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
