import "package:flutter/material.dart";

class Mybutton extends StatelessWidget {
  final color;
  final textcolor;
  final String buttontext;
  final buttunTaped;

  const Mybutton({this.color, this.textcolor, this.buttontext,this.buttunTaped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:buttunTaped ,
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: color,
            child: Center(child: Text(buttontext,style: TextStyle(color: textcolor,fontSize: 22,fontWeight: FontWeight.bold),),),
          )),
      ),
    );
  }
}
