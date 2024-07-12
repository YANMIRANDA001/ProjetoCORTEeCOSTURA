import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title; // Título do produto
  final String imageUrl; // URL da imagem do produto
  final double price; // Preço do produto

  const ProductCard({
    Key? key,
    required this.title, // Título do produto é necessário
    required this.imageUrl, // URL da imagem do produto é necessário
    required this.price, // Preço do produto é necessário
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // Widget Card para envolver o conteúdo do produto
      elevation: 4, // Sombra do card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Borda arredondada do card
      ),
      child: Column(
        // Coluna para dispor os widgets verticalmente
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            // ClipRRect para definir bordas arredondadas na imagem
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              // Exibição da imagem do produto
              imageUrl,
              height: 200, // Altura da imagem
              fit: BoxFit.cover, // Ajuste da imagem dentro do espaço disponível
            ),
          ),
          Padding(
            // Padding para adicionar espaçamento interno
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // Texto exibindo o título do produto
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8), // Espaçamento entre o título e o preço
                Text(
                  // Texto exibindo o preço do produto
                  'R\$ ${price.toStringAsFixed(2)}', // Exemplo de formatação do preço
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                SizedBox(height: 8), // Espaçamento entre o preço e o botão
                ElevatedButton(
                  // Botão para adicionar o produto ao carrinho
                  onPressed: () {
                    // Ação ao clicar no botão (por exemplo, adicionar ao carrinho)
                  },
                  child: Text('Adicionar ao Carrinho'), // Texto do botão
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
