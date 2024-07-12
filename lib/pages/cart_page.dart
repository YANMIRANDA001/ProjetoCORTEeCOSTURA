import 'package:flutter/material.dart';
import '../models/product.dart';

class CartPage extends StatefulWidget {
  final List<Product> cart;

  const CartPage({Key? key, required this.cart}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _increaseQuantity(Product product) {
    setState(() {
      product.quantity++;
    });
  }

  void _decreaseQuantity(Product product) {
    setState(() {
      if (product.quantity > 1) {
        product.quantity--;
      } else {
        widget.cart.remove(product);
      }
    });
  }

  void _removeFromCart(Product product) {
    setState(() {
      widget.cart.remove(product);
    });
  }

  double _calculateTotal() {
    return widget.cart.fold(
        0.0, (total, product) => total + (product.price * product.quantity));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9932CC), // Roxo um pouco mais claro
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
      ),
      backgroundColor: const Color(0xFFDDA0DD), // Roxo mais claro
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: widget.cart.isEmpty
            ? Center(
                child: Text(
                  'Seu carrinho está vazio!',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            : ListView.builder(
                itemCount: widget.cart.length,
                itemBuilder: (context, index) {
                  final product = widget.cart[index];
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                product.imagePath,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      product.description,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      'R\$${product.price.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove,
                                    color: Color(0xFF800080)),
                                onPressed: () => _decreaseQuantity(product),
                              ),
                              Text(
                                product.quantity.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add,
                                    color: Color(0xFF800080)),
                                onPressed: () => _increaseQuantity(product),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.red),
                                onPressed: () => _removeFromCart(product),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Total: R\$${(product.price * product.quantity).toStringAsFixed(2)}',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'R\$${_calculateTotal().toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
