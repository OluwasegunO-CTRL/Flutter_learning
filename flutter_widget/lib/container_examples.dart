import 'dart:math';
import 'package:flutter/material.dart';

class ContainerExamples extends StatelessWidget {
  const ContainerExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 139, 125, 36)

      ),
      
      body: Center(
        child: Container(
          // big logo example
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          // margin: const EdgeInsets.all(50),
          // decoration: const FlutterLogoDecoration(),
        
        
          // Boxshadow example
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          // margin: const EdgeInsets.all(25.0),
          // decoration: ShapeDecoration(
          //     color: Colors.white, 
          //     shadows: const [
          //       BoxShadow(color: Colors.black, blurRadius: 15.0)
          //     ],
          //     shape: Border.all(
          //       color: Colors.red,
          //       width: 8.0,
          //     ),
          //   ),
          //   child: const Center(
          //     child: Text('Hello Flutter',
          //     textAlign: TextAlign.center,)
          // ),
        
          // border container example
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          // margin: const EdgeInsets.all(23),
          // decoration:  BoxDecoration(
          //   color: Colors.yellow,
          //   borderRadius: BorderRadius.circular(55),
          //   border: Border.all(
          //     width: 5,
          //     color: Colors.red
          //   )
          // ),
          //  child: const Center(child: Text('Hello Flutter', textAlign: TextAlign.center)),
          
        
          // alignment container example
          // margin: const  EdgeInsets.all(20),
          // width: double.infinity,
          // height: 300,
          // color: Colors.red,
          // alignment: Alignment.topRight,
          // padding: const  EdgeInsets.all(20),
          // child: const FlutterLogo(size: 100,),
        
        
          // container with minwidth and maxwidth boxconstraint example
          //  margin: const EdgeInsets.all(20.0),
          //   constraints: const BoxConstraints(
          //     maxWidth: 400.0,
          //     minWidth: 200.0
          //   ),
          //   width: 50.0,
          //   alignment: Alignment.topCenter,
          //   child: 
          //   Stack(
          //    alignment: Alignment.center,
          //     children: [
          //       Image.network('https://picsum.photos/500/400',
          //     loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          //       if (loadingProgress == null) {
          //         return child;
          //       } else {
          //         return Stack(
          //           alignment: Alignment.center,
          //           children:[ CircularProgressIndicator(
          //             value: loadingProgress.expectedTotalBytes != null
          //                 ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
          //                 : null,
          //           ),
          //           ]
          //         );
          //       }
          //     },
          //     ),
          //     ]
          //   ),
    

          // container with list of box shadow
          // margin: const EdgeInsets.all(18),
          // height: 100.0,
          // width: 200.0,
          // decoration: const BoxDecoration(
          //       color: Colors.white,
          //       boxShadow: [
          //       BoxShadow(color: Colors.red, blurRadius: 12.0 ),
          //       BoxShadow(color: Colors.green, blurRadius: 40.0),
          //       ]
        // ),

        // container with image and rounded borders
        // height: 200,
        // width: 200,
        // decoration:  BoxDecoration(
        //   borderRadius: BorderRadius.circular(25),
        //   color: Colors.white,
        //   image: const DecorationImage(
        //     fit: BoxFit.cover,
        //     image: NetworkImage('https://picsum.photos/200/300')
        //     )
        // ),

        // rounded container
        // height: 200,
        // width: 200,
        // alignment: Alignment.center,
        // decoration:  BoxDecoration(
        //   borderRadius: BorderRadius.circular(200),
        //   color: Colors.green,
        // ),
        // child: const Text('Hello'),


        // container with horizontal radius
        // height: 200,
        // width: 200,
        // alignment: Alignment.center,
        // decoration: const  BoxDecoration(
        //   borderRadius: BorderRadius.horizontal(
        //     left: Radius.circular(20),
        //     right: Radius.circular(80)
        //   ),
        //   color: Colors.green,
        // ),
        // child: const Text('Hello'),


        // container with horizontal radius
        // height: 200,
        // width: 200,
        // alignment: Alignment.center,
        // decoration: const  BoxDecoration(
        //   borderRadius: BorderRadius.vertical(
        //     top: Radius.circular(20),
        //     bottom: Radius.circular(80)
        //   ),
        //   color: Colors.green,
        // ),
        // child: const Text('Hello'),






        ),
      )
    );


  }
}