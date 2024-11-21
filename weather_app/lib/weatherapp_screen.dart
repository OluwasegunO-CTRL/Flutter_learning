import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Weather App',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: (){print('refresh');}, 
          icon: const Icon(Icons.refresh)
          ),
      ],
      ),
      body: const  Column(
        children: [
            // maincard
             Card( 
              child: Column(
                children: [
                  Text('300 °F', style: TextStyle(
                    fontSize: 50,
                  ),)
                ],)
             ),
             SizedBox(height: 20),
            //  weatherforcast Hieghts
            Placeholder(
              fallbackHeight: 150,
            ),
            SizedBox(height: 20),
            // Additional information
            Placeholder(
              fallbackHeight: 150,
            )

        ],
      ),
    );
  }
}