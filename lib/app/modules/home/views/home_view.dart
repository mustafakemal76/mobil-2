import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/widgets/current_weather_widget.dart';
import 'package:weather_app/app/widgets/weather_card_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hava Durumu'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade800, Colors.blue.shade200],
          ),
        ),
        child: Obx(() {
          if (controller.weather.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }
          return Column(
            children: [

              // === EKLENECEK WIDGET ÖRNEKLERİ BAŞLANGIÇ ===

              RichText(
                text: TextSpan(
                  text: 'Rich ',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(text: 'Text ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Widget', style: TextStyle(fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
              Wrap(
                spacing: 8.0,
                children: List.generate(4, (index) => Chip(label: Text('Chip \$index'))),
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Container(color: Colors.red, width: 50, height: 50),
                    VerticalDivider(),
                    Container(color: Colors.blue, width: 50, height: 80),
                  ],
                ),
              ),
              RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.rotate_right),
              ),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(color: Colors.purple),
              ),
              Image.network('https://via.placeholder.com/150'),
              FadeInImage.assetNetwork(
                placeholder: 'assets/loading.png',
                image: 'https://via.placeholder.com/150',
              ),
              Placeholder(),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
              ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {},
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('OutlinedButton'),
              ),
              InkWell(
                onTap: () {},
                child: Text('InkWell ile tıklanabilir metin'),
              ),
              ListTile(
                leading: Icon(Icons.cloud),
                title: Text('ListTile Başlık'),
                subtitle: Text('Açıklama'),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Card İçeriği'),
                ),
              ),
              Stack(
                children: [
                  Container(width: 100, height: 100, color: Colors.green),
                  Positioned(top: 10, left: 10, child: Icon(Icons.star)),
                ],
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(decoration: InputDecoration(labelText: 'Adınız')),
                    CheckboxListTile(value: true, onChanged: (_) {}, title: Text('Kabul Ediyorum')),
                    RadioListTile(value: 1, groupValue: 1, onChanged: (_) {}, title: Text('Seçenek 1')),
                    SwitchListTile(value: true, onChanged: (_) {}, title: Text('Aç / Kapa')),
                    Slider(value: 0.5, onChanged: (_) {}),
                    DropdownButton(items: [
                      DropdownMenuItem(child: Text('Seçenek 1'), value: '1'),
                    ], onChanged: (_) {}),
                  ],
                ),
              ),
              // === EKLENECEK WIDGET ÖRNEKLERİ BİTİŞ ===

              CurrentWeatherWidget(weather: controller.weather.first),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.weather.length,
                  itemBuilder: (context, index) {
                    return WeatherCardWidget(
                      weather: controller.weather[index],
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}