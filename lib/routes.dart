import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/resto_model.dart';
import 'package:flutter_food_delivery_ui/screens/home_screen.dart';
import 'package:flutter_food_delivery_ui/screens/restaurant_screen.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/restaurant':
        if (args is Restaurants) {
          return MaterialPageRoute(
            builder: (_) => RestaurantScreen(restaurants: args),
          );
        }
        return _error();
      default:
        return _error();
    }
  }

//Error
  static Route<dynamic> _error() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('ERROR!'),
        ),
      ),
    );
  }
}
