import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/menu_model.dart';
import 'package:flutter_food_delivery_ui/models/resto_model.dart';
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

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
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
                _buildTopIcons(),
                //Address
                _buildAddress(),
                //Search
                Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const TextField(
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      hintText: 'Search for restaurant, food etc',
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
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
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    itemCount: restaurants.length,
                    itemBuilder: (BuildContext context, int index) {
                      Restaurants restaurant = restaurants[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        height: 80.0,
                        color: Colors.amber,
                        child: Row(
                          children: [
                            Container(
                              height: 80.0,
                              width: 80.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  restaurant.name,
                                  style: const TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(restaurant.category),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddress() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Deliver to',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 5.0),
          Row(
            children: const [
              Icon(Icons.place_outlined),
              Text(
                'Jl.Kaliurang, Yogyakarta',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopIcons() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notes_rounded,
              size: 32.0,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 32.0,
            ),
          ),
        ],
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
                      SizedBox(
                        height: 45.0,
                        width: 45.0,
                        child: SvgPicture.asset(menus.imgUrl),
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
