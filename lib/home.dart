import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class calculator extends StatefulWidget {
  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  var result = "0";

  Widget btn(var textt) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            if (result == "0" || result == "00" || result == "000") {
              result = "";
            }
            result += textt;
          });
        },
        child: Text(textt));
  }

  clr() {
    setState(() {
      result = "0";
    });
  }

  rem() {
    setState(() {
      result += "%";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "My Calculator App",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    result,
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [btn("7"), btn("8"), btn("9"), btn("+")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [btn("4"), btn("5"), btn("6"), btn("-")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [btn("1"), btn("2"), btn("3"), btn("*")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [btn("0"), btn("00"), btn("000"), btn("/")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: clr, child: Text("Clr")),
                  btn("."),
                  ElevatedButton(onPressed: output, child: Text("=")),
                  ElevatedButton(onPressed: rem, child: Text("Rem")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
