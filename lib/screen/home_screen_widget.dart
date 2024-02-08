import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';



Widget drawPurpleCircle(double start, double y) {
  return Align(
    alignment: AlignmentDirectional(start, y),
    child: Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.deepPurple,
      ),
    ),
  );
}

Widget drawOrangeSquare(double start, double y) {
  return Align(
    alignment: AlignmentDirectional(start, y),
    child: Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.orange,
      ),
    ),
  );
}

Widget produceGradientColor(double sigmaX, double sigmaY) {
  return BackdropFilter(

    filter: ImageFilter.blur(
      sigmaX: 100,
      sigmaY: 100
    ),

    child: Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
    ),
  );
}


Widget displayCurrentLocation(String? locationName, String? country) {
  return Row(
    children: [
      Text(
        '📍 ${locationName}',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
      SizedBox(width: 8),

      CountryFlag.fromCountryCode(
        '${country}',
        height: 48,
        width: 62,
        borderRadius: 8,
      ),
    ],
  );
}



Widget displayGreeting(DateTime dateTime){

  String greeting;

  if (dateTime.hour < 12) {
    greeting = 'Good Morning';
  } else if (dateTime.hour < 18) {
    greeting = 'Good Afternoon';
  } else {
    greeting = 'Good Evening';
  }

  return Text(
    greeting,
    style: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget displayWeatherImage(int code){
  switch (code) {
    case >= 200 && < 300 :
      return Image.asset(
          'assets/weather/1.png'
      );
    case >= 300 && < 400 :
      return Image.asset(
          'assets/weather/2.png'
      );
    case >= 500 && < 600 :
      return Image.asset(
          'assets/weather/3.png'
      );
    case >= 600 && < 700 :
      return Image.asset(
          'assets/weather/4.png'
      );
    case >= 700 && < 800 :
      return Image.asset(
          'assets/weather/5.png'
      );
    case == 800 :
      return Image.asset(
          'assets/weather/6.png'
      );
    case > 800 && <= 804 :
      return Image.asset(
          'assets/weather/7.png'
      );
    default:
      return Image.asset(
          'assets/weather/7.png'
      );
  }
}

Widget displayWeatherTemperature(int tempreature){
  return Center(
    child: Text(
      '${tempreature} °C',
      style: const TextStyle(
          color: Colors.white,
          fontSize: 55,
          fontWeight: FontWeight.w600
      ),
    ),
  );
}

Widget displayWeatherCondition(String condition){
  return Center(
    child: Text(
      '${condition}',
      style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w500
      ),
    ),
  );
}

Widget displayCurrentDate(String datetime){
  return Center(
    child: Text(
      "${datetime}",
      style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w300
      ),
    ),
  );
}

Widget displayWeatherDetails(String filename, String label, String date){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.asset(
        filename,
        scale: 8,
      ),
      SizedBox(width: 5,),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 3,),
          Text(
            date,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      )
    ],
  );
}

Widget displayDivider(){
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Divider(
      color: Colors.grey,
    ),
  );
}

