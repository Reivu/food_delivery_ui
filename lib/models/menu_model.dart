class Menu {
  String imgUrl;
  String menuName;

  Menu({
    required this.imgUrl,
    required this.menuName,
  });
}

List<Menu> menu = [
  Menu(
    imgUrl: 'assets/icons/resto.svg',
    menuName: 'Restaurants',
  ),
  Menu(
    imgUrl: 'assets/icons/food.svg',
    menuName: 'Foods',
  ),
  Menu(
    imgUrl: 'assets/icons/drink.svg',
    menuName: 'Drinks',
  ),
];
