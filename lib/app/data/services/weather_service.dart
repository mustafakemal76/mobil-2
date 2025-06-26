import 'package:dio/dio.dart';
import 'package:weather_app/app/data/models/base_model.dart';

class WeatherService {
  static final WeatherService _instance = WeatherService._internal();
  WeatherService._internal();
  static WeatherService get instance => _instance;

  final dio = Dio();
  final String _baseUrl = 'https://api.collectapi.com/weather/getWeather';
  final String _apiKey = '2PSAauQUwIzciR0QsCWLYC:1fni3EJzD71jh5lrSgYqGY';

  Future<BaseResponseModel> getWeather(String city) async {
    final response = await dio.get(
      _baseUrl,
      queryParameters: {'data.lang': 'tr', 'data.city': city},
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': 'apikey $_apiKey',
        },
      ),
    );
    return BaseResponseModel.fromJson(response.data);
  }
}
