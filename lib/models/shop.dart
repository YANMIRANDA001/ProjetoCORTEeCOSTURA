import 'package:flutter/material.dart';
import '../componentes/my_drawer.dart';
import '../models/product.dart';
import '../pages/cart_page.dart';

class ShopPage extends StatefulWidget {
  final List<Product> cart; // Adicione o parâmetro cart ao construtor

  const ShopPage({Key? key, required this.cart}) : super(key: key); // Defina o parâmetro cart no construtor

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final List<Product> _cart = [];

  void _addItem(Product product) {
    setState(() {
      if (_cart.contains(product)) {
        product.quantity++;
      } else {
        _cart.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> imagens = [
      'assets/destaque2.png',
      'assets/camisa4.png',
      'assets/camisa3.png',
      'assets/destaque4.png',
    ];

    List<String> nomes = [
      'Produto 1',
      'Produto 2',
      'Produto 3',
      'Produto 4',
    ];

    List<String> descricoes = [
      'Descrição do Produto 1',
      'Descrição do Produto 2',
      'Descrição do Produto 3',
      'Descrição do Produto 4',
    ];

    List<double> precos = [
      10.00,
      15.00,
      20.00,
      25.00,
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Produtos em Destaque",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage(cart: widget.cart)), // Passe o parâmetro cart ao construir CartPage
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          const SizedBox(height: 25),
          const Center(
            child: Text(
              "Somente Produtos Selecionados",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: imagens.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                return AspectRatio(
                  aspectRatio: 3 / 6,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Image.asset(
                            imagens[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nomes[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                descricoes[index],
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 58, 56, 56),
                                ),
                              ),
                              Text(
                                'Preço: R\$${precos[index].toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  final produto = Product(
                                    name: nomes[index],
                                    description: descricoes[index],
                                    price: precos[index],
                                    imagePath: imagens[index],
                                  );
                                  _addItem(produto);
                                },
                                child: const Text('Adicionar ao Carrinho'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
