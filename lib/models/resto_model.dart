class Restaurants {
  String name;
  String imageUrl;
  String category;
  int star;
  double review;
  int comment;

  Restaurants({
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.star,
    required this.review,
    required this.comment,
  });
}

List<Restaurants> restaurants = [
  Restaurants(
    name: 'Hungry Station',
    imageUrl: 'assets/images/logo1.jpg',
    category: 'Indian',
    star: 5,
    review: 4.5,
    comment: 72,
  ),
  Restaurants(
    name: 'Mr. Chef',
    imageUrl: 'assets/images/logo2.jpg',
    category: 'Snacks',
    star: 4,
    review: 4.2,
    comment: 30,
  ),
  Restaurants(
    name: 'Caffee Station',
    imageUrl: 'assets/images/logo3.jpg',
    category: 'Drinks',
    star: 3,
    review: 3.2,
    comment: 15,
  ),
  Restaurants(
    name: 'Salt Bae',
    imageUrl: 'assets/images/logo4.jpg',
    category: 'Pizza',
    star: 4,
    review: 4.0,
    comment: 720,
  ),
];
