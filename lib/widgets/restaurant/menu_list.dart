import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/food_model.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Bottom Line
          Container(
            decoration: const BoxDecoration(
              // color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            //Menu
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              physics: const BouncingScrollPhysics(),
              labelColor: Colors.pink[200],
              indicatorColor: Colors.pink[200],
              unselectedLabelColor: Colors.black,
              indicatorWeight: 3.0,
              tabs: const [
                Tab(
                  text: 'Featured Items',
                ),
                Tab(
                  text: 'Burger',
                ),
                Tab(
                  text: 'Pizza',
                ),
                Tab(
                  text: 'Drinks',
                ),
                Tab(
                  text: 'Side Dishes',
                ),
              ],
            ),
          ),
          //Food List
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildFoodList(),
                const Center(
                  child: Text('It\'s rainy here'),
                ),
                const Center(
                  child: Text('It\'s sunny here'),
                ),
                const Center(
                  child: Text('It\'s warm here'),
                ),
                const Center(
                  child: Text('It\'s cold here'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: food.length,
      itemBuilder: (BuildContext context, int index) {
        Food foods = food[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  foods.imageUrl,
                  fit: BoxFit.cover,
                  width: 80.0,
                  height: 80.0,
                ),
              ),
              const SizedBox(width: 10.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foods.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(foods.description),
                  ],
                ),
              ),
              const SizedBox(width: 10.0),
              Text(
                '\$${foods.price}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
