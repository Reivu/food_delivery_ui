import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/resto_model.dart';
import 'package:flutter_food_delivery_ui/widgets/home/top_icons.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurants restaurants;
  const RestaurantScreen({Key? key, required this.restaurants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: SafeArea(
        child: Column(
          children: [
            const TopIcons(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 80.0,
              // color: Colors.amber,
              child: Row(
                children: [
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
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.timelapse_rounded,
                                    size: 11.0,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    '25 Mins',
                                    style: TextStyle(
                                      fontSize: 11.0,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
