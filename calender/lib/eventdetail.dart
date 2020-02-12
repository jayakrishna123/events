import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body:Column(
         children: <Widget>[
           Container(
             height: 400,
             child: Image(image: AssetImage("images/jayakrishna.jpg"))),
           Card(
                child: Container(
              height: 80,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    child: Image.asset("images/jayakrishna.jpg"),
                  ),
                  SizedBox(width:30),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Flutter Workshop"),
                        Text("8.00 pm ,12-03-2020"),
                        Text("Bhrath university"),
                      ])
                ],
              ),
            )),
         ],
       ),
      
    );
  }
}