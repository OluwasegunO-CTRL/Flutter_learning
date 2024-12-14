import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  late Future <Map<String, dynamic>> weather;

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

    } catch (e) {
        throw e.toString();
    }
  }

 @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
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
          onPressed: (){
            setState(() {
             weather = getCurrentWeather(); 
            });
          }, 
          icon: const Icon(Icons.refresh)
          ),
      ],
      ),
      body: FutureBuilder(
        future: weather,
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
            final currentPressure =  currentWeatherData['main']['pressure'];
            final currenthumidity =  currentWeatherData['main']['humidity'];
            final currentWind =  currentWeatherData['wind']['speed'];

          
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
              // SingleChildScrollView(
              // scrollDirection: Axis.horizontal,
              //   child:  Row(
              //     children: [
              //       for(int i = 0; i < 39; i++) 
              //       HourlyForecastItem(
              //         time: data['list'][i + 1]['dt'].toString(),
              //         icon: data['list'][i + 1]['weather'][0]['main'] == 'Clouds' || data['list'][i + 1]['weather'][0]['main'] == 'Rain' ? Icons.cloud: Icons.sunny,
              //         temp: data['list'][i + 1]['main']['temp'].toString(),
              //       ),
                    
              //     ],
              //   ),
              // ),

              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    final hourlyFORECAST = data['list'][index + 1];
                    final forecastSky = hourlyFORECAST['weather'][0]['main'];
                    
                    // convert temperature from Kelvin to Celsius
                    const kelvinToCelsius = 273.15;
                    final  rawTemp = hourlyFORECAST['main']['temp'];
                    final hourlyTemp = (rawTemp - kelvinToCelsius).toInt();
                    final time = DateTime.parse(hourlyFORECAST['dt_txt']);
                    
                    return HourlyForecastItem(
                      time: DateFormat.Hm().format(time), 
                      icon: forecastSky == 'Clouds' || forecastSky == 'Rain' ? Icons.cloud: Icons.sunny, 
                      temp: '${hourlyTemp.toString()} °C'
                      );
                    
                  },
                
                ),
              ),

              const SizedBox(height: 30),
              // Additional information
              const  Text('Additional Information', 
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    AdditionalInfoItem(
                      icon: Icons.water_drop,
                      label: 'Humidity',
                      value: currenthumidity.toString(),
                    ),
                    AdditionalInfoItem(
                      icon: Icons.air,
                      label: 'Wind speed',
                      value: currentWind.toString(),
                      ),
                    AdditionalInfoItem(
                      icon: Icons.beach_access,
                      label: 'Pressure',
                      value: currentPressure.toString(),
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

