import 'package:flutter/material.dart';

class TextFieldExample extends StatelessWidget {
  const TextFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('TextField Example'),
      //   backgroundColor: Colors.amber,
      //   centerTitle: true,
      // ),

        // body: Center(
        // child:  TextField(
        //   // controller: TextEditingController(),
        //   decoration: InputDecoration(
        //     border: OutlineInputBorder(
        //       borderSide: const  BorderSide(
        //         width: 0,
        //         style: BorderStyle.none
        //       ),
        //       borderRadius: BorderRadius.circular(10)
        //     ),
        //     filled: true,
        //     hintText: 'Type in your text',
        //   ),
        

         body: 
          Center(
            child: Padding( padding: EdgeInsets.all(30.0),
              child: TextField(
                decoration: InputDecoration(
                border:  OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.all(
                   Radius.circular(10.0),
                ),
              ),
              filled: true,
              hintText: "Type in your text"),
                  ),
            ),
          )
          );
      
  }
}