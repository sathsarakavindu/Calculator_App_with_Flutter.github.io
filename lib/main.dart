
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

String output = "0";
String _output = "0";
double num1 = 0;
double num2 = 0;
String operand = "";




buttonPressed(String buttonText){

if(buttonText == "CLEAR"){
 _output = "0";
 num1 = 0;
 num2 = 0;
 operand = "";

}
else if(buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "x"){

  num1 = double.parse(output);
  operand = buttonText;
  _output = "0";

}
else if(buttonText == "."){
 
 if(_output.contains(".")){
  print("Already contains a decimal");

 }
 else{
   _output = _output + buttonText;

 }

}
else if(buttonText == "="){

  num2 = double.parse(output); 
 if(operand == "+"){

  _output = (num1 + num2).toString();
 }
 if(operand == "-"){

  _output = (num1 - num2).toString();
 }
 if(operand == "x"){

  _output = (num1 * num2).toString();
 
 }
 if(operand == "/"){

  _output = (num1 / num2).toString();
 }
 
 num1 = 0;
 num2 = 0;
 operand = "";

}
else{

  _output = _output + buttonText;
}

  print(output);

  setState(() {
    
    output = double.parse(_output).toStringAsFixed(0);
  });
}

Widget buildButton(String buttonText){
 return(

    Expanded(
      child: SizedBox(
        height: 70.0,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: OutlinedButton(
           
           onPressed: ()=> buttonPressed(buttonText),
           
           child: Text(
            buttonText,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
           ),
           
          ),
        ),
      ),
  )
 );  
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: new Text(widget.title,
         style: TextStyle(fontWeight: FontWeight.bold),
         ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Color.fromARGB(255, 250, 250, 250),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                color: Color.fromARGB(255, 240, 204, 246),
                child: Text(
                  output,
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Expanded(
                child: Divider(
                  
                ), 
                
              ),
              
              new Column(
                children: [
                  new Row(
                    children: [
                     
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("/"),
                    ],                   
                  ),

                  new Row(
                    children: [
                      buildButton("6"),
                      buildButton("5"),
                      buildButton("4"),
                      buildButton("x"),
                    ],
                  ),

                  new Row(
                    children: [
                      buildButton("3"),
                      buildButton("2"),
                      buildButton("1"),
                      buildButton("-"),
                    ],
                  ),
                  new Row(
                    children: [
                      buildButton("."),
                      buildButton("0"),
                      buildButton("00"),
                      buildButton("+"),
                    ],
                  ),

                  new Row(
                    children: [
                      buildButton("CLEAR"),
                      buildButton("="),
                      
                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

 
}