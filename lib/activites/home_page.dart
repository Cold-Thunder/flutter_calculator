import 'dart:ffi';

import 'package:calculator/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePage createState()=>_HomePage();
}
List char = [
  'C','DEL', '/', 'x',
  7,8,9,'-',
  4,5,6,'+',
  1,2,3,'=',
  '%',0,'.', 'ANS'
];
class _HomePage extends State<HomePage>{
  var ansVal = '';
  var questVal = '';
  bool font = false;

  @override
  Widget build(BuildContext context){
    final hei = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      height: hei*0.33,
                      alignment: Alignment.centerLeft,
                      child: Text(ansVal != '' ? ansVal : 'Answer', style: TextStyle(
                        fontSize: font == false ? 26 : 40,
                        color: Colors.white
                      ))
                    ),
                    Container(
                      width: double.infinity,
                      height: hei*0.33,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerRight,
                      child: Text(questVal != '' ? questVal : 'Question', style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                        textDirection: TextDirection.ltr,
                        maxLines: 1
                      ),
                    )
                  ]
                )
              )
            ),
            Expanded(
              flex: 2,
                child: Container(
                  height: hei*0.66,
                  alignment: Alignment.center,
                color: Colors.black,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: char.length,
                  itemBuilder: (context, index){
                    if(char[index].toString() == 'C'){
                      return Buttons(name: char[index].toString(), func: cButton, bgClr: Colors.green);
                    }else if(char[index] == 'DEL'){
                      return Buttons(name: char[index].toString(), func: delFunc, bgClr: Colors.red);
                    }
                    else if(char[index].toString() == '+' || char[index].toString() == '-' || char[index].toString() == 'x' || char[index].toString() == '/'){
                      return Buttons(name: char[index].toString(), func: quest, bgClr: Colors.blue.shade500);
                    }else if(char[index].toString() == '='){
                      return Buttons(name: char[index].toString(), func: equalBtn, bgClr: Colors.blue.shade500);
                    }else if(char[index].toString() == 'ANS'){
                      return Buttons(name: char[index].toString(), func: ansButton, bgClr: Colors.purple);
                    } else{
                      return Buttons(name: char[index].toString(), func: quest);
                    }
                  }
            )))
          ]
        )
      )
    );
  }
  quest(val){
    setState((){
      questVal += val;
    });
  }
  delFunc(){
    setState((){
      questVal = questVal.substring(0, questVal.length-1);
    });
  }
  cButton(){
    setState((){
      questVal = '';
    });
  }
  equalBtn(){
    String finalQuest = questVal;
    finalQuest = finalQuest.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuest);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState((){
      ansVal = eval.toString();
      font = false;
    });
  }
  ansButton(){
    setState((){
      questVal = '';
      font = true;
    });
  }
}