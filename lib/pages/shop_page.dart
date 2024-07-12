import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projeto_vander/componentes/my_drawer.dart';
import 'package:projeto_vander/models/product.dart';
import 'package:projeto_vander/pages/cart_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Inova',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const ShopPage(),
    );
  }
}

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final List<Product> _shop = [
    Product(
      name: 'Ecobag floral',
      description: 'Ecobag com estampas florais',
      price: 38.00,
      imagePath: 'assets/bolsa-florida-3.JPG',
    ),
    Product(
      name: 'Ecobag estampada',
      description: 'Ecobag com estampas em vermelho e preto',
      price: 39.99,
      imagePath: 'assets/bolsa-colorida.JPG',
    ),
    Product(
      name: 'Mochila laranja',
      description: 'Mochila laranja tipo saco',
      price: 26.00,
      imagePath: 'assets/sacola-laranja.jpg',
    ),
    Product(
      name: 'Mochila azul',
      description: 'Mochila azul tipo saco',
      price: 26.00,
      imagePath: 'assets/sacola-roxa.jpg',
    ),
    Product(
      name: 'Ecobags',
      description: 'Ecobags em promoção',
      price: 99.99,
      imagePath: 'assets/modelos.jpg',
    ),
    Product(
      name: 'Colar pentágono',
      description: '',
      price: 38.00,
      imagePath: 'assets/colar2.png',
    ),
    Product(
      name: 'Ecobag rosa',
      description: 'Ecobag rosa com estampas',
      price: 79.99,
      imagePath: 'assets/bolsa-rosa-segurando.jpg',
    ),
    Product(
      name: 'Colar espiral',
      description: '',
      price: 150.99,
      imagePath: 'assets/colar-redondo-2.jpg',
    ),
  ];

  final List<Product> _cart = []; // Carrinho de compras

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              product.imagePath,
              fit: BoxFit.cover,
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'R\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
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
                backgroundColor: const Color(0xFF9932CC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              label: cartQuantity > 0
                  ? Text(
                      'Adicionar ao carrinho (${cartQuantity.toString()})',
                      style: const TextStyle(color: Colors.white),
                    )
                  : const Text(
                      'Adicionar ao carrinho',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9932CC),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'TECH INOVA',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'CORTE E COSTURA',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
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
                const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                if (_cart.isNotEmpty)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      radius: 10,
                      child: Text(
                        _cart.length.toString(),
                        style: const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: Container(
        color: const Color(0xFFDDA0DD),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 300, // Ajustado para aumentar o tamanho do carrossel
                      enableInfiniteScroll: true,
                      autoPlay: true,
                    ),
                    items: _shop.map((product) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.grey[200], // Cor de fundo temporária
                            ),
                            child: Image.asset(
                              product.imagePath,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          color: Color(0xFF9932CC),
                          thickness: 2,
                          indent: 16.0,
                          endIndent: 8.0,
                        ),
                      ),
                      Text(
                        'Produtos em destaque',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9932CC),
                         
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Color(0xFF9932CC),
                          thickness: 2,
                          indent: 8.0,
                          endIndent: 16.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.6,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _buildProductItem(_shop[index]);
                },
                childCount: _shop.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
