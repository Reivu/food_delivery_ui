import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/resto_model.dart';
import 'package:flutter_food_delivery_ui/widgets/home/top_icons.dart';
import 'package:flutter_food_delivery_ui/widgets/restaurant/delivery.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurants restaurants;
  const RestaurantScreen({Key? key, required this.restaurants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.brown[50],
                  height: 200.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Top Icons
                    const TopIcons(),
                    //Restaurant Information
                    _buildRestaurantInfo(),
                    //Rating and Review
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: Row(
                        children: [
                          Text(
                              '⭐ ${restaurants.review.toString()} (${restaurants.comment.toString()} Reviews)'),
                          const SizedBox(width: 10.0),
                          const Text(
                            'See Reviews',
                            style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 80.0,
      child: Row(
        children: [
          //Image
          Hero(
            tag: restaurants.imageUrl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                restaurants.imageUrl,
                fit: BoxFit.cover,
                height: 80.0,
                width: 80.0,
              ),
            ),
          ),
          //Restaurant Information
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      restaurants.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text(
                        'OPEN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11.0,
                          letterSpacing: 1.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(restaurants.category),
                const Delivery(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
