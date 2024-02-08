import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc_bloc.dart';
import 'home_screen_widget.dart';
import 'package:intl/intl.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget displayWeatherInformation(BuildContext context) {
    return BlocBuilder <WeatherBlocBloc, WeatherBlocState> (
        builder: (context, state) {
          if (state is WeatherBlocSuccess){
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  displayCurrentLocation(state.weather.areaName, state.weather.country),
                  displayGreeting(state.weather.date!),
                  displayWeatherImage(state.weather.weatherConditionCode!),  // You can replace this with your icon selection method
                  displayWeatherTemperature(state.weather.temperature!.celsius!.round()),
                  displayWeatherCondition(state.weather.weatherMain!),
                  displayCurrentDate(DateFormat().add_jm().format(state.weather.date!) ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      displayWeatherDetails('assets/weather/11.png', 'Sunrise', DateFormat().add_jm().format(state.weather.sunrise!)),
                      displayWeatherDetails('assets/weather/12.png', 'Sunset', DateFormat().add_jm().format(state.weather.sunset!)),
                    ],
                  ),
                  displayDivider(),
                  Row(
                    children: [
                      displayWeatherDetails('assets/weather/14.png', 'Temp Min', '${state.weather.tempMin!.celsius!.round()}°C'),
                      displayWeatherDetails('assets/weather/14.png', 'Temp Max', '${state.weather.tempMax!.celsius!.round()}°C'),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 40),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,

            child: Stack(
              children: [

                drawPurpleCircle(3, -0.3),
                drawPurpleCircle(-3,-0.3),
                drawOrangeSquare(0,-1.2),
                produceGradientColor(100, 100),
                displayWeatherInformation(context),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
