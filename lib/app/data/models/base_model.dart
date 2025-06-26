import 'package:weather_app/app/data/models/weather_model.dart';

class BaseResponseModel {
  bool? success;
  String? city;
  List<WeatherModel>? result;

  BaseResponseModel({this.success, this.city, this.result});

  BaseResponseModel copyWith({
    bool? success,
    String? city,
    List<WeatherModel>? result,
  }) {
    return BaseResponseModel(
      success: success ?? this.success,
      city: city ?? this.city,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'city': city, 'result': result};
  }

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return BaseResponseModel(
      success: json['success'] as bool?,
      city: json['city'] as String?,
      result:
          (json['result'] as List<dynamic>?)
              ?.map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  @override
  String toString() =>
      "BaseResponseModel(success: $success,city: $city,result: $result)";

  @override
  int get hashCode => Object.hash(success, city, result);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseResponseModel &&
          runtimeType == other.runtimeType &&
          success == other.success &&
          city == other.city &&
          result == other.result;
}
