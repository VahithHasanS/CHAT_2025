// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const Mainapp());
}

class Mainapp extends StatefulWidget {
  const Mainapp({super.key});

  @override
  State<Mainapp> createState() => _MainappState();
}

class _MainappState extends State<Mainapp> {
  double size = 0;
  double size1 = 0;
  String inputvalue = "";

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 5;
    size1 = MediaQuery.of(context).size.width / 6;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              height: 200,
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerRight,
                child: Text(
                  inputvalue,
                  style: const TextStyle(color: Colors.white, fontSize: 100),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    _calcbutton("7", Colors.white38),
                    _calcbutton("8", Colors.white38),
                    _calcbutton("9", Colors.white38),
                    _calcbutton("/", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _calcbutton("4", Colors.white38),
                    _calcbutton("5", Colors.white38),
                    _calcbutton("6", Colors.white38),
                    _calcbutton("*", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _calcbutton("1", Colors.white38),
                    _calcbutton("2", Colors.white38),
                    _calcbutton("3", Colors.white38),
                    _calcbutton("-", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _calcbutton("0", Colors.white38),
                    _calcbutton(".", Colors.white38),
                    _calcbutton("=", Colors.orange),
                    _calcbutton("+", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _calcbutton("Clear", Colors.orange),
                    _calcbutton("⌫", Colors.grey),
                    SizedBox(
                      width: size,
                    ), // Optional spacing if you want to center
                    SizedBox(width: size),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _calcbutton(String text, Color bgcolor) {
    return InkWell(
      onTap: () {
        setState(() {
          if (text == "Clear") {
            inputvalue = "";
          } else if (text == "=") {
            try {
              Parser p = Parser();
              Expression exp = p.parse(inputvalue);
              ContextModel cm = ContextModel();
              double eval = exp.evaluate(EvaluationType.REAL, cm);
              inputvalue = eval.toString();
            } catch (e) {
              inputvalue = "Error";
            }
          } else {
            inputvalue += text;
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: const EdgeInsets.all(10),
        height: size1,
        width: size,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}