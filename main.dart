import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.yellow,
      ),
     home: new MyHomePage(title: 'Jean Dalmont (Calculator)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

mixin required {
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){

    if(buttonText == "CLR"){
      
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else if (
      buttonText == "+" ||
      buttonText == "-" ||
      buttonText == "/" ||
      buttonText == "X" ||
      buttonText == "x^2" ||
      buttonText == "sqrt" ||
      buttonText == "%"){

      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";

    } else if(buttonText == "."){

      if(_output.contains(".")){
        print("Already conatains a decimals");
        return;

      } else {
        _output = _output + buttonText;
      }

    } else if (buttonText == "="){

      num2 = double.parse(output);

      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "X"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }
       if(operand == "%"){
        _output = ((num1) / 100).toString();
      }
      if(operand == "x^2"){
        _output = (num1 * num1).toString();
      }
      if(operand == "sqrt"){
        _output = (sqrt(num1)).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else {

      _output = _output + buttonText;

    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }
  
  Widget buildButton(String buttonText) {
    return new Expanded( 
      child: new OutlineButton(
        padding: new EdgeInsets.all(30.0),
        child: new Text(buttonText,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          ),
        onPressed: () => 
          buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Container(color: Colors.black87,
            child: new Column(
          children: <Widget>[
            new Container( color: Colors.black45,
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.symmetric(
                vertical: 80.0,
                horizontal: 10.0
              ),
              child: new Text(output, style: new TextStyle(
                fontSize: 50.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              ),
              ),
            new Expanded(
              child: new Divider(),
            ),
            
            new Column(children: [

              new Row(children: [
                buildButton("sqrt"),
                buildButton("x^2"),
                buildButton("%"),
                buildButton("/")
              ]),

              new Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("X")
              ]),

              new Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("-")
              ]),

              new Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("+")
              ]),

              new Row(children: [
                buildButton("CLR"),
                buildButton("0"),
                buildButton('.'),
                buildButton("="),
              ]),

            ])
          ],
        ),
        ),
        );
  }
}