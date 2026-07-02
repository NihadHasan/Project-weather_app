import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_model.dart';

class TodaysWeather extends StatelessWidget {
  final WeatherModel? weatherModel;

  const TodaysWeather({super.key, this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Weather Background
        WeatherBg(
          weatherType: WeatherType.sunnyNight, // You can change this dynamically
          width: double.infinity,
          height: 300,
        ),

        /// Foreground Content
        SizedBox(
          width: double.infinity,
          height: 300,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    /// Location Name
                    Text(
                      weatherModel?.location?.name ?? "",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    /// Date
                    Text(
                      weatherModel?.current?.lastUpdated != null
                          ? DateFormat.yMMMMEEEEd().format(
                          DateTime.parse(weatherModel!.current!.lastUpdated!))
                          : "",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  const SizedBox(width: 10),

                  /// Weather Icon
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white10,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Image.network(
                      "https:${weatherModel?.current?.condition?.icon ?? ""}",
                      width: 50,
                      height: 50,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error, color: Colors.white),
                    ),
                  ),

                  const Spacer(),

                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Temperature Value
                          Text(
                            weatherModel?.current?.tempC?.round().toString() ?? "",
                            style: const TextStyle(fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          /// Degree Symbol (°C)
                          const Text(
                            "°C",
                            style: TextStyle(fontSize:30,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink,
                            ),
                          ),
                        ],
                      ),

                      /// Weather Condition Text
                      Text(
                        weatherModel?.current?.condition?.text ?? "",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 10),
                ],
              ),

              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                     Column(
                       children: [
                         Text(
                           "Feels Like",
                           style: TextStyle(
                             fontSize: 15,
                             color: Colors.white,fontWeight: FontWeight.w300
                           ),
                         ),
                         Text(
                           weatherModel?.current?.feelslikeC?.round().toString()?? "",
                           style: TextStyle(
                               fontSize: 13,
                               color: Colors.white,fontWeight: FontWeight.bold
                           ),
                         ),
                       ],
                     ),

                       Column(
                         children: [
                           const Text(
                             "Wind",
                             style: TextStyle(
                                 fontSize: 15,
                                 color: Colors.white,fontWeight: FontWeight.w300
                             ),
                           ),
                           Text(
                             "${weatherModel?.current?.windKph?.round()}km/h",
                             style: TextStyle(
                                 fontSize: 13,
                                 color: Colors.white,fontWeight: FontWeight.bold
                             ),
                           ),
                         ],
                       ),

                   ],
                   ),
                    const SizedBox(
                      height: 5,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Humidity",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,fontWeight: FontWeight.w300
                              ),
                            ),
                            Text(
                              "${weatherModel?.current?.humidity}%",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            const Text(
                              "Visibility",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,fontWeight: FontWeight.w300
                              ),
                            ),
                            Text(
                              "${weatherModel?.current?.visKm?.round()}km",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
