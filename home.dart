// import 'package:flutter/material.dart';
// import 'package:weather_app/model/weather_model.dart';
// import 'package:weather_app/service/api_service.dart';
// import 'package:weather_app/ui/components/hourly_weather_listitem.dart';
// import 'package:weather_app/ui/components/todays_weather.dart';
// import 'package:weather_app/ui/components/future_forecast_listitem.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   ApiService apiService = ApiService();
//   final _textFieldController = TextEditingController();
//   String searchText = "auto:ip";
//   Future<WeatherModel>? _weatherFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchWeatherData();
//   }
//
//   void _fetchWeatherData() {
//     setState(() {
//       _weatherFuture = apiService.getWeatherData(searchText);
//     });
//   }
//
//   Future<String?> _showTextInputDialog(BuildContext context) async {
//     return showDialog<String>(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Search Location"),
//           content: TextField(
//             controller: _textFieldController,
//             decoration: const InputDecoration(
//                 hintText: "Search by city, zip, lat, lon"),
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_textFieldController.text.isNotEmpty) {
//                   Navigator.pop(context, _textFieldController.text);
//                 }
//               },
//               child: const Text("Ok"),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Center(
//           child: Text(
//             "Flutter Weather App",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Roboto',
//               fontSize: 20,
//             ),
//             textAlign: TextAlign.right,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () async {
//               String? text = await _showTextInputDialog(context);
//               if (text != null && text.isNotEmpty) {
//                 setState(() {
//                   searchText = text;
//                   _fetchWeatherData();
//                 });
//               }
//             },
//             icon: const Icon(Icons.search),
//           ),
//           IconButton(
//             onPressed: () {
//               setState(() {
//                 searchText = "auto:ip";
//                 _fetchWeatherData();
//               });
//             },
//             icon: const Icon(Icons.my_location),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: FutureBuilder<WeatherModel>(
//           future: _weatherFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }
//
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text(
//                   "Error has occurred: ${snapshot.error}",
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               );
//             }
//
//             if (snapshot.hasData) {
//               WeatherModel? weatherModel = snapshot.data;
//
//               return Column(
//                 children: [
//                   TodaysWeather(weatherModel: weatherModel!),
//                   const SizedBox(height: 10),
//                   const Text(
//                     "Weather by Hours",
//                     style: TextStyle(color: Colors.white, fontSize: 22),
//                   ),
//                   const SizedBox(height: 10),
//                   SizedBox(
//                     height: 150,
//                     child: ListView.builder(
//                       itemCount: weatherModel.forecast?.forecastday?[0].hour?.length ?? 0,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         Hour? hour = weatherModel.forecast?.forecastday?[0].hour?[index];
//                         return HourlyWeatherListItem(hour: hour);
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     "Next 7 Days Weather",
//                     style: TextStyle(color: Colors.white, fontSize: 22),
//                   ),
//                   const SizedBox(height: 10),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: weatherModel.forecast?.forecastday?.length ?? 0,
//                       itemBuilder: (context, index) {
//                         Forecastday? forecastday = weatherModel.forecast?.forecastday?[index];
//                         return FutureForecastListItem(forecastday: forecastday);
//                       },
//                     ),
//                   ),
//                 ],
//               );
//             }
//
//             return const Center(
//               child: Text("No data available", style: TextStyle(color: Colors.white)),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/api_service.dart';
import 'package:weather_app/ui/components/hourly_weather_listitem.dart';
import 'package:weather_app/ui/components/todays_weather.dart';
import 'package:weather_app/ui/components/future_forecast_listitem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();
  final _textFieldController = TextEditingController();
  String searchText = "auto:ip";
  Future<WeatherModel>? _weatherFuture;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  void _fetchWeatherData() {
    setState(() {
      _weatherFuture = apiService.getWeatherData(searchText);
    });
  }

  Future<String?> _showTextInputDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Search Location"),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(
                hintText: "Search by city, zip, lat, lon"),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (_textFieldController.text.isNotEmpty) {
                  Navigator.pop(context, _textFieldController.text);
                }
              },
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            "Flutter Weather App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              fontSize: 20,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              String? text = await _showTextInputDialog(context);
              if (text != null && text.isNotEmpty) {
                setState(() {
                  searchText = text;
                  _fetchWeatherData();
                });
              }
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                searchText = "auto:ip";
                _fetchWeatherData();
              });
            },
            icon: const Icon(Icons.my_location),
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<WeatherModel>(
          future: _weatherFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error has occurred: ${snapshot.error}",
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }

            if (snapshot.hasData) {
              WeatherModel? weatherModel = snapshot.data;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TodaysWeather(weatherModel: weatherModel!),
                      const SizedBox(height: 10),
                      const Text(
                        "Weather by Hours",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          itemCount: weatherModel.forecast?.forecastday?[0].hour?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Hour? hour = weatherModel.forecast?.forecastday?[0].hour?[index];
                            return HourlyWeatherListItem(hour: hour);
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Next 3 Days Weather",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: weatherModel.forecast?.forecastday?.length ?? 0,
                        itemBuilder: (context, index) {
                          Forecastday? forecastday = weatherModel.forecast?.forecastday?[index];
                          return FutureForecastListItem(forecastday: forecastday);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }

            return const Center(
              child: Text("No data available", style: TextStyle(color: Colors.white)),
            );
          },
        ),
      ),
    );
  }
}
