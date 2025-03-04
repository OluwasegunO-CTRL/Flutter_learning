import 'package:flutter/material.dart';

class ExamplesAppbar extends StatelessWidget {
  const ExamplesAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const  Text('Transparent AppBar'),
      ),
      
      // Appbar text with icon example
      //  appBar: AppBar(
      //     // automaticallyImplyLeading: false,
      //     title: const Text("Hello",
      //        style: TextStyle(fontSize: 25),),
          
      //     centerTitle: true,
      //     backgroundColor: Colors.red,
      //     actions: [
      //       IconButton(
      //         icon:  const Icon(Icons.search),
      //         onPressed:() {},
      //       ),
      //       IconButton(
      //         icon: const  Icon(Icons.add),
      //         onPressed: () {},
      //       ),
      //        IconButton(
      //         icon: const  Icon(Icons.more_vert),
      //         onPressed: () {},
      //       ),  
      //     ],
      //   ),

      // Centered Text Appbar example
      // appBar: AppBar(
      //     // automaticallyImplyLeading: false,
      //     title: const Center(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         mainAxisSize: MainAxisSize.max,
      //         children: [
      //            Text("Hello",
      //             style: TextStyle(fontSize: 25),),
      //            Text('Subtitle',
      //             style: TextStyle(
      //               fontSize: 18
      //             ),)
      //         ]   
      //       ),
      //     ),
      //     centerTitle: true,
      //     backgroundColor: Colors.red,
      //   ),

      // Appbar with flutter icon example
      //  appBar: AppBar(
      //   backgroundColor: Colors.pink,
      //   title:const Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       FlutterLogo(),
      //       Padding(padding: EdgeInsets.all(12)),
      //       Text('Title with Logo')

      //     ],

      //   ),
      // ),

      body: const Center(
          child:
          Text('Learning \nFlutter is fun',
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            letterSpacing:10,
            wordSpacing: 25,
            decorationStyle: TextDecorationStyle.wavy
          ),
          ),
        
        )



    );
  }
}