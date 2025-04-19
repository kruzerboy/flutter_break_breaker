import 'package:flutter/material.dart';
class MyBall extends StatelessWidget {
  const MyBall({super.key, this.ballX, this.ballY});
  final  ballX;
  final  ballY;

  @override
  Widget build(BuildContext context) {
    return  Container(
                   alignment:Alignment(ballX,ballY),
                   child: Container(
                     height: 15,
                    width: 15,
                     decoration: BoxDecoration(shape: BoxShape.circle,
                  
                  color: Colors.deepPurple
                  ),
                   )
    );
 
     
  }
}