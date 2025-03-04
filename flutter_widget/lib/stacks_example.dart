import 'package:flutter/material.dart';

class StacksExample extends StatelessWidget {
  const StacksExample ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
          appBar: AppBar(
             backgroundColor: Colors.amber
          ),

          // Stacks example
          body:  
        // Stack(
        //     alignment: Alignment.center,
        //     children: [
        //       Container(
        //     height: 300.0,
        //     width: 300.0,
        //     color: Colors.red,
        //   ),
        //   Container(
        //     height: 250.0,
        //     width: 250.0,
        //     color: Colors.green,
        //   ),
        //   Container(
        //     height: 200.0,
        //     width: 200.0,
        //     color: Colors.yellow,
        //   )
        //     ],

        //   ),

      //   
      
       Container(
        height: 400.0,
        // color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 300.0,
                width: 300.0,
                color: Colors.red,
              ),
              Positioned(
                top: 0.0,
                bottom: 0.0,
                child: Container(
                  height: 250.0,
                  width: 250.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}