
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_break_breaker/presentation/pages/coverscreen.dart';
import 'package:flutter_break_breaker/presentation/pages/myPlayer.dart';
import 'package:flutter_break_breaker/presentation/pages/my_ball.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //bal variable 
 double ballX= 0;
 double ballY = 0;
 //player varialble
 double playerwidth = 0.3;
 double playerX = 0;
 //game setting

 bool hasgameStarted = false;
 void startGame() {
  hasgameStarted =true;
  Timer.periodic(Duration(microseconds: 10), (timer) { 
    setState(() {
      ballY -=0.001;
    });
  });
 }
 //funct to move player  left
   void moveLeft(){
    setState(() {
    if(!(playerX - 0.2 <= -1)){// Adjust the value as needed for your game speed and screen size
      playerX -= 0.001;
    }
  });
   }
   // Function to move player right
  void moveRight() {
    setState(() {
       if(!(playerX + playerwidth >= 1)){// Adjust the value as needed for your game speed and screen size
    
      playerX += 0.001; // Adjust the value as needed for your game speed and screen size
       }
    });
  }
  @override
  Widget build(BuildContext context) {
  
    return KeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKeyEvent: (event){
  if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            moveLeft();
          } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            moveRight();
          }
        }
        
      },
      child: GestureDetector(
        onTap: startGame,
        child: Scaffold(backgroundColor:Colors.lightBlue,
        
          body:Center(
            child: Stack(
              children: [
                //for start game
            CoverScreen(hasgameStarted: hasgameStarted
            ),            
                  MyBall(
                    ballX: ballX,
                    ballY: ballY,
                  ),
                  //player
                  MyPlayer(playerwidth: playerwidth,
                  playerX: playerX,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
                  ),
                  //where is player x exactly
                  Container(
                    alignment: Alignment(playerX,0.9),
                    child: Container(
                      color:Colors.red,
                      width: 4,
                      height: 15,
                    ),
                  ),
                   Container(
                    alignment: Alignment(playerX+playerwidth,0.9),
                    child: Container(
                      color:Colors.red,
                      width: 4,
                      height: 15,
                    ),
                  )
            
              ],
              
            ),
        
        ),
      )
      ),
    );
    
  }
}
