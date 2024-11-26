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
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }


  Future getCurrentWeather() async {
    String cityName = 'Lagos';
    final res = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$openWeatherAPIKey'
        ),
      );
      print(res.body);

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
          onPressed: (){print('refresh');}, 
          icon: const Icon(Icons.refresh)
          ),
      ],
      ),
      body:  Padding(
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
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text('300 °K', style: 
                            TextStyle(
                              fontSize: 32,
                              fontWeight:FontWeight.bold 
                            ),
                          ),
                          SizedBox(height: 16,),
                          Icon(Icons.cloud,
                            size: 64,),
                          SizedBox(height: 16,),
                          Text('Rain', 
                            style: TextStyle(
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
      ),
    );
  }
}

