class WeatherModel {
  String? date;
  String? day;
  String? icon;
  String? description;
  String? status;
  String? degree;
  String? min;
  String? max;
  String? night;
  String? humidity;

  WeatherModel({
    this.date,
    this.day,
    this.icon,
    this.description,
    this.status,
    this.degree,
    this.min,
    this.max,
    this.night,
    this.humidity,
  });

  WeatherModel copyWith({
    String? date,
    String? day,
    String? icon,
    String? description,
    String? status,
    String? degree,
    String? min,
    String? max,
    String? night,
    String? humidity,
  }) {
    return WeatherModel(
      date: date ?? this.date,
      day: day ?? this.day,
      icon: icon ?? this.icon,
      description: description ?? this.description,
      status: status ?? this.status,
      degree: degree ?? this.degree,
      min: min ?? this.min,
      max: max ?? this.max,
      night: night ?? this.night,
      humidity: humidity ?? this.humidity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'day': day,
      'icon': icon,
      'description': description,
      'status': status,
      'degree': degree,
      'min': min,
      'max': max,
      'night': night,
      'humidity': humidity,
    };
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      date: json['date'] as String?,
      day: json['day'] as String?,
      icon: json['icon'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      degree: json['degree'] as String?,
      min: json['min'] as String?,
      max: json['max'] as String?,
      night: json['night'] as String?,
      humidity: json['humidity'] as String?,
    );
  }

  @override
  String toString() =>
      "WeatherModel(date: $date,day: $day,icon: $icon,description: $description,status: $status,degree: $degree,min: $min,max: $max,night: $night,humidity: $humidity)";

  @override
  int get hashCode => Object.hash(
    date,
    day,
    icon,
    description,
    status,
    degree,
    min,
    max,
    night,
    humidity,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherModel &&
          runtimeType == other.runtimeType &&
          date == other.date &&
          day == other.day &&
          icon == other.icon &&
          description == other.description &&
          status == other.status &&
          degree == other.degree &&
          min == other.min &&
          max == other.max &&
          night == other.night &&
          humidity == other.humidity;
}
