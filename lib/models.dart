class Product {
  String image;
  int num;
  bool icon = false;

  Product(this.image, this.num);
}

class ProductList {
  static List<Product> products = [
    Product("asset/images/img_1.png", 1),
    Product("asset/images/img_2.png", 2),
    Product("asset/images/img_3.png", 3),
    Product("asset/images/img_4.png", 4),
    Product("asset/images/img_5.png", 5),
  ];

}

class ProductList2 {
  static List<Product> product = [
    Product("asset/images2/1ec.jpg", 1),
    Product("asset/images2/30d.jpg", 2),
    Product("asset/images2/2007k.jpg", 3),
    Product("asset/images2/anta.jpg", 4),
    Product("asset/images2/cr.jpg", 5),
  ];

  static List<String> likedList = [];
}

