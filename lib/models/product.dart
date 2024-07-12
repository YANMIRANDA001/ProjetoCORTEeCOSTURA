class Product {
  final String name;
  final String description;
  final double price;
  final String imagePath;
  int quantity;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    this.quantity = 0,
  });
}
