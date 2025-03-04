import 'package:flutter/material.dart';

class Buttonexample extends StatelessWidget {
  const Buttonexample({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber
      ),

      body: 
      Center(
  //       child: ElevatedButton(
  //       onPressed: () {},
  // style: ElevatedButton.styleFrom(
  //   backgroundColor: Colors.blue, // Button background
  //   foregroundColor: Colors.white, // Text color
  //   elevation: 5, // Elevation effect
  //   shadowColor: Colors.black, // Shadow color
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(12), // Rounded corners
  //   ),
  //   ),
  // child: const Text('Elevated Button')
  // )
      
      // TextButton example
      // child: MaterialButton(
      //   onPressed: () {
      //     print('pressed');
      //   },
      //   colorBrightness: Brightness.dark,
      //   color: Colors.deepPurpleAccent,
      //   splashColor: Colors.red,
      //   elevation: 20.0,
      //   // highlightColor: Colors.green,
      //   highlightElevation: 10,
      //   child: const Text("Material Button"),
      //   ),

        
      // TextButton example
      // child: TextButton(
      //   onPressed: () {},
      //   style: TextButton.styleFrom(
      //     backgroundColor: Colors.deepPurpleAccent,
      //     overlayColor: Colors.red,
      //     foregroundColor: Colors.white       
      //     ),
      //   child: const Text('Textbutton'),
      //   )

          // There are two styles here, aslways use the styleFrom option and not ButtonStyle
       
          // style:  ButtonStyle(
          //   side: const WidgetStatePropertyAll(
          //     BorderSide(
          //     width: 2,
          //     color: Colors.deepPurpleAccent,
          //   ),
          //   ),
          //   shape: const WidgetStatePropertyAll(
          //     RoundedRectangleBorder(
          //   borderRadius: BorderRadius.vertical(
          //   top: Radius.circular(20.0), bottom: Radius.circular(1.0))
          // )
          //   ),
          //   overlayColor: WidgetStateColor.resolveWith(
          //     (states) => Colors.red.withValues(alpha: 0.5)
          //   ),      
          // ),

          // child: IconButton(
          //   onPressed: () {print('renew');},
          //   icon: const Icon(
          //     Icons.build,
          //     size: 50,
          //   ),
          //   splashColor: Colors.yellow,
          //   // highlightColor: Colors.black,
          //   color: Colors.purple,
          //   )

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.orange,
                onPressed: (){},
                child: const Icon(Icons.mic, size: 30, color: Colors.white,),
                ),
                FloatingActionButton(onPressed: (){},
                mini: true,
                backgroundColor: Colors.green,
                child: const Icon(Icons.mic, size: 30, color: Colors.white,),
                )
            ],

          ),
          
          

      )
    );
  }
}