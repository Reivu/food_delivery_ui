class Food {
  String name;
  String imageUrl;
  String description;
  double price;

  Food({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });
}

List<Food> food = [
  Food(
    name: 'Peri Pizza',
    imageUrl: 'assets/images/pizza.jpg',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    price: 15,
  ),
  Food(
    name: 'Mexican Pasta',
    imageUrl: 'assets/images/pasta.jpg',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    price: 5,
  ),
  Food(
    name: 'Salad',
    imageUrl: 'assets/images/salad.jpg',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    price: 6,
  ),
  Food(
    name: 'Burger',
    imageUrl: 'assets/images/burger.jpg',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    price: 7,
  ),
  Food(
    name: 'Ice Cream',
    imageUrl: 'assets/images/ice.jpg',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    price: 3,
  ),
];
