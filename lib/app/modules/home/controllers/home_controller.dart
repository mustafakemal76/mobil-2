import 'package:get/get.dart';
import 'package:weather_app/app/data/models/weather_model.dart';
import 'package:weather_app/app/data/services/weather_service.dart';

class HomeController extends GetxController {
  final weatherService = WeatherService.instance;
  final weather = <WeatherModel>[].obs;

  Future<void> getWeather(String city) async {
    final response = await weatherService.getWeather(city);
    weather.value = response.result ?? [];
  }

  @override
  void onInit() {
    super.onInit();
    getWeather('ığdır');
  }
}
