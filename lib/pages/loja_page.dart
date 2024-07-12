import 'package:flutter/material.dart';
import 'package:projeto_vander/models/product.dart';
import 'package:projeto_vander/pages/cart_page.dart';

class LojaPage extends StatefulWidget {
  const LojaPage({Key? key}) : super(key: key);

  @override
  _LojaPageState createState() => _LojaPageState();
}

class _LojaPageState extends State<LojaPage> {
  final List<Product> _shop = [
    Product(
      name: 'Ecobag azul',
      description: 'Ecobag com estampas em tons de azul',
      price: 46.00,
      imagePath: 'assets/bolsa-azul-deitada.jpg',
    ),
    Product(
      name: 'Ecobag floral',
      description: 'Ecobag com estampas florais',
      price: 38.00,
      imagePath: 'assets/bolsa-florida.jpg',
    ),
    Product(
      name: 'Mochila laranja',
      description: 'Mochila laranja tipo saco',
      price: 26.00,
      imagePath: 'assets/sacola-laranja.jpg',
    ),
    Product(
      name: 'Ecobag rosa',
      description: 'Ecobag rosa com estampas de borboletas',
      price: 45.00,
      imagePath: 'assets/bolsa-rosa-em-pe.jpg',
    ),
  ];

  final List<Product> _cart = [];

  void _addToCart(Product product) {
    setState(() {
      final existingProductIndex =
          _cart.indexWhere((item) => item.name == product.name);
      if (existingProductIndex != -1) {
        _cart[existingProductIndex].quantity++;
      } else {
        _cart.add(Product(
          name: product.name,
          description: product.description,
          price: product.price,
          imagePath: product.imagePath,
          quantity: 1,
        ));
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.name} adicionado ao carrinho')),
    );
  }

  Widget _buildProductItem(Product product) {
    int cartQuantity = _cart
        .where((cartProduct) => cartProduct.name == product.name)
        .fold(0, (sum, item) => sum + item.quantity);

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              'R\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            TextButton.icon(
              onPressed: () => _addToCart(product),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF9932CC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              label: cartQuantity > 0
                  ? Text(
                      'Adicionar (${cartQuantity.toString()})',
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(
                      'Adicionar',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9932CC),
        title: Text(
          'TECH INOVA',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage(cart: _cart)),
              );
            },
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart_outlined, color: Colors.white),
                if (_cart.isNotEmpty)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      radius: 10,
                      child: Text(
                        _cart.length.toString(),
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFDDA0DD),
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _shop.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: _buildProductItem(_shop[index]),
            );
          },
        ),
      ),
    );
  }
}
