import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget{
  String name;
  Color? bgClr;
  late Function func;
  Buttons({
    required this.name,
    required this.func,
    this.bgClr,
  });
  @override
  Widget build(BuildContext context){
    return GridTile(
        child: SizedBox.expand(
        child: InkWell(
        onTap: (){
          if(name == 'DEL' || name == 'C' || name == '=' || name == 'ANS'){
            func();
          }else{
            func(name);
          }
        },
            splashColor: Colors.red,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bgClr != null ? bgClr : Colors.black,
          ),
          child: Text('$name', style: TextStyle(
              fontSize: 28,
              color: Colors.white
          ))
        )
      ))
    );
  }
}