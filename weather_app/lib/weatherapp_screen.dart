import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/hourlyforecast_item.dart';
import 'package:weather_app/additionalinfo_item.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';



class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // double temp = 0;

  // // @override
  // void initState() {
  //   super.initState();
  //   getCurrentWeather();
  // }

  Future <Map<String, dynamic>> getCurrentWeather() async {
    try{
       String cityName = 'Lagos';
    final res = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey'
        ),
      );
      
      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw 'An unexpected error occured';
      }


      return data;

      // setState(() {
        //  temp = data['list'][0]['main']['temp'];
      // });
    } catch (e) {
        throw e.toString();
    }
  }

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
          onPressed: (){}, 
          icon: const Icon(Icons.refresh)
          ),
      ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          // print(snapshot);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive()
            );
          }         
          if (snapshot.hasError){
            return Center(
              child: Text(snapshot.hasError.toString())
            );
          }

           final data = snapshot.data!;

           final currentWeatherData = data['list'][0];
           double currentTemp = currentWeatherData['main']['temp'];
            double currentTempo = currentTemp - 274.15;
            int realTemp = currentTempo.toInt();

            final currentSky =  currentWeatherData['weather'][0]['main'];
          
          return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                // maincard
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                    ),
                  elevation: 10, 
                  child:   ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child:  Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('$realTemp °C', 
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight:FontWeight.bold 
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Icon(
                              currentSky == 'Clouds' || currentSky == 'Rain' ? Icons.cloud: Icons.sunny,
                              size: 64,),
                            const SizedBox(height: 16,),
                            Text( currentSky, 
                              style: const TextStyle(
                                fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
             const  SizedBox(height: 20),
             const Text('Weather Forecast', 
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 16),
                //  weatherforcast Hieghts
              const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child:  Row(
                  children: [
                    HourlyForecastItem(
                      time: '09:00',
                      icon: Icons.cloud,
                      temp: '307 K',
                    ),
                    HourlyForecastItem(
                      time: '12:00',
                      icon: Icons.sunny,
                      temp: '306.5 K',
                    ),
                    HourlyForecastItem(
                      time: '15:00',
                      icon: Icons.cloud,
                      temp: '305 K',
                    ),
                    HourlyForecastItem(
                      time: '18:00',
                      icon: Icons.cloudy_snowing,
                      temp: '297 K',
                    ),
                    HourlyForecastItem(
                      time: '21:00',
                      icon: Icons.thunderstorm,
                      temp: '290.5 K',
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Additional information
              const  Text('Additional Information', 
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    AdditionalInfoItem(
                      icon: Icons.water_drop,
                      label: 'Humidity',
                      value: '96',
                    ),
                    AdditionalInfoItem(
                      icon: Icons.air,
                      label: 'Humidity',
                      value: '96',
                      ),
                    AdditionalInfoItem(
                      icon: Icons.beach_access,
                      label: 'Humidity',
                      value: '96',
                      )                  
                ],
              )
            ],
          ),
        );
        },
      ),
    );
  }
}

