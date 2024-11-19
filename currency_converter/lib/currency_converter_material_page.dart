import 'package:flutter/material.dart';
// 1. create a variable that stores the converted currency value
// 2. create a function that multiplies the values given by the textfield
// 3. Store the value in the variable that we created
// 4. Display the value

class CurrencyConverterMaterialPage extends StatefulWidget{
  const CurrencyConverterMaterialPage({super.key});
  
  @override
  State createState() {
    return _CurrencyConverterMaterialPageState();
  } 
}

class _CurrencyConverterMaterialPageState extends State{
   double result = 0;
    final TextEditingController textEditingController = TextEditingController();
  
  @override
  Widget build (BuildContext context){  
    final border =  OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(10)
    );

    return  Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 2,
        title: const  Text('Currency Converter', 
          style: TextStyle(
          color: Colors.white)
          ),
        centerTitle: true,
        actions: [
        IconButton(
          onPressed:() {}, 
          icon: const  Icon(Icons.search),
          color: Colors.white,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              'N $result', 
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255)
              ),
              ),
            Padding(
              padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: textEditingController,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ), 
                  decoration: InputDecoration(
                    hintText: 'please enter the amount in USD',
                    hintStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    prefixIcon: const Icon(Icons.monetization_on_outlined),
                    prefixIconColor: Colors.black,
                    filled:true,
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    focusedBorder: border, 
                    border:border,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                   result = double.parse(textEditingController.text) * 1500;  
                  });
                },
                style:  ElevatedButton.styleFrom(
                  elevation: (20),
                  backgroundColor:(Colors.black),
                  foregroundColor:(Colors.amber),
                  minimumSize: const Size(350, 50),
                  shape: (RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                    )
                  )
                ), 
                child: const Text('Convert'),
                ),
              ),
          ],
        ), 
      )
    );
  }
}