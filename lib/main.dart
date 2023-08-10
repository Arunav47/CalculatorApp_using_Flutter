import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Calc(),
    );
  }
}

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  var input = "";
  var res = "";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(title: Text('Calculator'), backgroundColor: Colors.black,),
      body: 
      new Column(
        children: <Widget>[
          new Expanded(
            flex: 3,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              new Container(
                child: new Text(input, style: new TextStyle(color: Colors.white, fontSize: 70)),
              ),
              new Container(
                margin: EdgeInsets.only(right: 10, bottom: 5),
                child: new Text(res.toString(), style: new TextStyle(color: Colors.white, fontSize: 70),),
              ),
              new Container(
                alignment: Alignment.bottomRight,
                // child: new ElevatedButton(child: Icon(Icons.backspace_outlined, color: Colors.grey,), onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),),
                child: new IconButton(onPressed: (){
                  setState(() {
                    if (input.isNotEmpty && input.length>1) {  
                      input = input.substring(0, input.length-1);
                      equalbutton();
                    }
                    else{
                      input = "";
                      res = "";
                    }
                  });
                }, icon: Icon(Icons.backspace_outlined, color: Colors.grey,)),
                height: 20,
                margin: EdgeInsets.only(right: 5, bottom: 15),
              )
            ],
          )),
          new Divider(color: Colors.grey,),
          new Expanded(
            flex: 5,
            child: new Column(
            children: [
              new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = '';
                      res = '';
                    });
                  }, child: Text('AC', style: new TextStyle(fontSize: 25),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 22, 104, 237)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
                new Container(
                  child: new ElevatedButton(onPressed: (){setState(() {
                    input = input + '(';
                  });}, child: Text('(', style: new TextStyle(fontSize: 45, color: Color.fromARGB(255, 34, 197, 40)),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = input+')';
                    });
                  }, child: Text(')', style: new TextStyle(fontSize: 45, color: Color.fromARGB(255, 34, 197, 40)),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = input+'/';
                    });
                  }, child: Text('/', style: new TextStyle(fontSize: 45, color: Color.fromARGB(255, 34, 197, 40)),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
              ],
            ),
              new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = input+'7';
                      equalbutton();
                    });
                  }, child: Text('7', style: new TextStyle(fontSize: 25),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = input+'8';
                      equalbutton();
                    });
                  }, child: Text('8', style: new TextStyle(fontSize: 25),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = input+'9';
                      equalbutton();
                    });
                  }, child: Text('9', style: new TextStyle(fontSize: 25),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = input+'*';
                    });
                  }, child: Text('x', style: new TextStyle(fontSize: 45, color: Color.fromARGB(255, 34, 197, 40)),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
              ],
            ),
              new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = input+'4';
                      equalbutton();
                    });
                  }, child: Text('4', style: new TextStyle(fontSize: 25),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = input+'5';
                      equalbutton();
                    });
                  }, child: Text('5', style: new TextStyle(fontSize: 25),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = input+'6';
                      equalbutton();
                    });
                  }, child: Text('6', style: new TextStyle(fontSize: 25,),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = input+'-';
                    });
                  }, child: Text('-', style: new TextStyle(fontSize: 55, color: Color.fromARGB(255, 34, 197, 40)),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
              ],
            ),
              new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = input+'1';
                      equalbutton();
                    });
                  }, child: Text('1', style: new TextStyle(fontSize: 25),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = input+'2';
                      equalbutton();
                    });
                  }, child: Text('2', style: new TextStyle(fontSize: 25),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = input+'3';
                      equalbutton();
                    });
                  }, child: Text('3', style: new TextStyle(fontSize: 25),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = input+'+';
                    });
                  }, child: Text('+', style: new TextStyle(fontSize: 55, color: Color.fromARGB(255, 34, 197, 40)),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
              ],
            ),
              new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = input + '.';
                    });
                  }, child: Text('.', style: new TextStyle(fontSize: 25),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      input = input + '0';
                      equalbutton();
                    });
                  }, child: Text('0', style: new TextStyle(fontSize: 25),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 31, 30, 30)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
                new Container(
                  child: new ElevatedButton(onPressed: (){}, child: Text('ANS', style: new TextStyle(fontSize: 22),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Color.fromARGB(255, 215, 29, 60)),
                  ),
                  
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
                new Container(
                  child: new ElevatedButton(onPressed: (){
                    setState(() {
                      equalbutton();
                    });
                  }, child: Text('=', style: new TextStyle(fontSize: 55),),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor:Color.fromARGB(255, 34, 197, 40)),
                  ),
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(7),
                ),
              ],
            ),
            ],
          ))
        ],
      ),
    );
  }
  void equalbutton() {
    String userinput = input;
    userinput = input.replaceAll('x', '*');
    Parser expression = Parser();
    Expression exp = expression.parse(userinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    res = eval.toString();
  }
}
