import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/menu_model.dart';
import 'package:flutter_food_delivery_ui/models/resto_model.dart';
import 'package:flutter_food_delivery_ui/widgets/home/address.dart';
import 'package:flutter_food_delivery_ui/widgets/home/search.dart';
import 'package:flutter_food_delivery_ui/widgets/home/top_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedMenus = 0;
  void _onTab(int index) {
    setState(() {
      _selectedMenus = index;
    });
  }

  _buildRatings(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(
      stars,
      style: const TextStyle(
        fontSize: 10.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.brown[50],
              height: 270.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Top Icons
                const TopIcons(),
                //Address
                const Address(),
                //Search
                const Search(),
                //List Menus
                _buildMenus(),
                //Restaurants
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Popular Restaurants',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildRestaurants()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurants() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        itemCount: restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          Restaurants restaurant = restaurants[index];
          return GestureDetector(
            //For tapping translucent background
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.of(context).pushNamed(
                '/restaurant',
                arguments: restaurant,
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              height: 80.0,
              child: Row(
                children: [
                  Hero(
                    tag: restaurant.imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        restaurant.imageUrl,
                        fit: BoxFit.cover,
                        height: 80.0,
                        width: 80.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          restaurant.name,
                          style: const TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(restaurant.category),
                        Row(
                          children: [
                            _buildRatings(restaurant.star),
                            const SizedBox(width: 5.0),
                            Text(restaurant.review.toString()),
                            const SizedBox(width: 5.0),
                            Text(
                              '(${restaurant.comment.toString()} Reviews)',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenus() {
    return SizedBox(
      height: 140.0,
      // color: Colors.amber,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
        scrollDirection: Axis.horizontal,
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          Menu menus = menu[index];
          return GestureDetector(
            onTap: () {
              _onTab(index);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 130.0,
              width: 100.0,
              decoration: BoxDecoration(
                color:
                    _selectedMenus == index ? Colors.pink[100] : Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0.0, 5.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      SvgPicture.asset(
                        menus.imgUrl,
                        width: 45.0,
                        height: 45.0,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    menus.menuName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          _selectedMenus == index ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
