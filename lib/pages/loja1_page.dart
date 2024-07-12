import 'package:flutter/material.dart';
import 'package:projeto_vander/models/product.dart';
import 'package:projeto_vander/pages/cart_page.dart';

class Loja1Page extends StatefulWidget {
  const Loja1Page({Key? key}) : super(key: key);

  @override
  _Loja1PageState createState() => _Loja1PageState();
}

class _Loja1PageState extends State<Loja1Page> {
  final List<Product> _shop1 = [
    Product(
      name: 'Regata branca',
      description: 'Regata com estampas de caveira',
      price: 65.99,
      imagePath: 'assets/camiseta-caveira.jpg',
    ),
    Product(
      name: 'Regata laranja',
      description: 'Regata tie dye laranja',
      price: 69.99,
      imagePath: 'assets/camiseta-despertar-laranja.jpg',
    ),
    Product(
      name: 'Regata preta',
      description: 'Regata preta com amarração no ombro',
      price: 79.99,
      imagePath: 'assets/camisa2.png',
    ),
    Product(
      name: 'Camiseta laranja',
      description: 'Camiseta laranja com amarração',
      price: 60.90,
      imagePath: 'assets/camisa4.png',
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'R\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child: TextButton.icon(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return ListView.builder(
      itemCount: _shop1.length,
      itemBuilder: (context, index) {
        return _buildProductItem(_shop1[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9932CC),
        title: Text(
          'Outros Produtos',
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
        child: _shop1.isEmpty
            ? Center(child: Text('Nenhum produto disponível'))
            : _buildProductList(),
      ),
    );
  }
}
