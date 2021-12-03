import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/resto_model.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurants restaurants;
  const RestaurantScreen({Key? key, required this.restaurants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(restaurants.name),
      ),
    );
  }
}
