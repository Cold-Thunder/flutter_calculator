import 'dart:ffi';

import 'package:calculator/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  quest(val){
    print(val);
  }
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
                color: Colors.blue,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(5),
                      height: hei*0.33,
                      child: Text('Answer', style: TextStyle(
                        fontSize: 26,
                        color: Colors.white
                      ))
                    ),
                    Container(
                      width: double.infinity,
                      height: hei*0.33,
                      padding: EdgeInsets.all(3),
                      color: Colors.red,
                      child: Text('Question', style: TextStyle(
                        fontSize: 26,
                        color: Colors.white
                      ))
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
                      return Buttons(name: char[index].toString(), func: quest, bgClr: Colors.green);
                    }else if(char[index].toString() == 'DEL'){
                      return Buttons(name: char[index].toString(), func: quest, bgClr: Colors.red);
                    }
                    else if(char[index].toString() == '+' || char[index].toString() == '-' || char[index].toString() == 'x' || char[index].toString() == '/'){
                      return Buttons(name: char[index].toString(), func: quest, bgClr: Colors.grey.shade500);
                    }else if(char[index].toString() == '='){
                      return Buttons(name: char[index].toString(), func: quest, bgClr: Colors.blue.shade500);
                    }else if(char[index].toString() == 'ANS'){
                      return Buttons(name: char[index].toString(), func: quest, bgClr: Colors.purple);
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
}