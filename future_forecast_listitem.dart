import 'package:flutter/material.dart';
import '../../model/weather_model.dart';

class FutureForecastListItem extends StatelessWidget {
  final Forecastday? forecastday;
  const FutureForecastListItem({super.key, this.forecastday});

  @override
  Widget build(BuildContext context) {
    // Check if forecastday is null to avoid errors
    if (forecastday == null) {
      return SizedBox.shrink(); // Return an empty widget if forecastday is null
    }

    // Formatting the date to a more readable format
    DateTime date = DateTime.parse(forecastday?.date ?? '2025-01-01');
    String formattedDate = "${date.day}/${date.month}/${date.year}";

    // Extracting the day of the week
    String dayOfWeek = _getDayOfWeek(date.weekday);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: EdgeInsets.all(8),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures that items are spaced out
        children: [
          // Weather Icon
          Image.network(
            forecastday?.day?.condition?.icon ?? "https://example.com/default_icon.png",
            height: 50,
            width: 50,
          ),
          // Weather details (day, date, temperature)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between items
              children: [
                // Day of the week (e.g., Monday, Tuesday)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dayOfWeek,
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    // Date in format "day/month/year"
                    Text(
                      formattedDate,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                // Temperature (Max and Min)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Max: ${forecastday?.day?.maxtempC ?? "N/A"}°C / Min: ${forecastday?.day?.mintempC ?? "N/A"}°C",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(height: 5),
                    // Weather condition text (e.g., "Clear", "Cloudy", etc.)
                    Text(
                      forecastday?.day?.condition?.text ?? "No description",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to convert integer weekday to string (e.g. 0 -> Sunday)
  String _getDayOfWeek(int weekday) {
    switch (weekday) {
      case 1: return 'Monday';
      case 2: return 'Tuesday';
      case 3: return 'Wednesday';
      case 4: return 'Thursday';
      case 5: return 'Friday';
      case 6: return 'Saturday';
      case 7: return 'Sunday';
      default: return 'Unknown';
    }
  }
}
