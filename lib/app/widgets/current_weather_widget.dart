import 'package:flutter/material.dart';
import 'package:weather_app/app/data/models/weather_model.dart';
import 'package:weather_app/app/widgets/weather_info_widget.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherModel weather;

  const CurrentWeatherWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            '${weather.date}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.network(
                    weather.icon ?? '',
                    width: 80,
                    height: 80,
                    errorBuilder:
                        (context, error, stackTrace) => const Icon(
                          Icons.wb_sunny,
                          size: 80,
                          color: Colors.yellow,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${weather.description}',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '${weather.degree}°',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${weather.day}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherInfoWidget(label: 'En Düşük', value: '${weather.min}°'),
              WeatherInfoWidget(label: 'En Yüksek', value: '${weather.max}°'),
              WeatherInfoWidget(label: 'Nem', value: '%${weather.humidity}'),
              WeatherInfoWidget(label: 'Gece', value: '${weather.night}°'),
            ],
          ),
        ],
      ),
    );
  }
}
