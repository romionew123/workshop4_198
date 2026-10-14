class FoodMenu {
  String name;
  String component;
  int price;
  Foodpic foodpic;
  FoodType foodType;

  FoodMenu({
    required this.name,
    required this.component,
    required this.price,
    required this.foodpic,
    required this.foodType,
  });
}

enum FoodType {
  ttype1(ty: "สเต็ก"),
  ttype2(ty: "สุกี้"),
  ttype3(ty: "ผัดไทย"),
  ttype4(ty: "ข้าวผัด");

  const FoodType({required this.ty});
  final String ty;
}

enum Foodpic {
  menu1(image: "assets/images/1.png", namefood: "สุกี้"),
  menu2(image: "assets/images/2.png", namefood: "สเต็ก"),
  menu3(image: "assets/images/3.png", namefood: "ผัดไทย"),
  menu4(image: "assets/images/4.png", namefood: "ข้าวผัด");

  const Foodpic({required this.image, required this.namefood});
  final String image;
  final String namefood;
}