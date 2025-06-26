import 'package:flutter/material.dart';
import 'package:weather_app/app/data/models/weather_model.dart';

class WeatherCardWidget extends StatelessWidget {
  final WeatherModel weather;

  const WeatherCardWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${weather.date}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${weather.day}',
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${weather.description}',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            Image.network(
              weather.icon ?? '',
              width: 50,
              height: 50,
              errorBuilder:
                  (context, error, stackTrace) => const Icon(
                    Icons.wb_sunny,
                    size: 50,
                    color: Colors.yellow,
                  ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${weather.degree}°',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${weather.min}° / ${weather.max}°',
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
