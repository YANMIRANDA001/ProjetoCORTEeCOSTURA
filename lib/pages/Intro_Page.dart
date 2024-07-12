import 'package:flutter/material.dart';
import 'package:projeto_vander/componentes/my_drawer.dart'; // Verifique o caminho correto do drawer
import 'package:projeto_vander/models/product.dart'; // Verifique o caminho correto do modelo de produto
import 'package:projeto_vander/pages/cart_page.dart'; // Verifique o caminho correto da página do carrinho

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xFFBA55D3), // Roxo médio
              Color(0xFFD8BFD8), // Roxo médio
              Color(0xFFDDA0DD), // Roxo claro
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png', // Caminho correto da sua imagem
                width: 170,
                height: 170,
                fit: BoxFit.cover, // Ajuste para o tamanho desejado
              ),
              const Text(
                "TECH INOVA CORTE E COSTURA",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "produtos de qualidade",
                style: TextStyle(
                  color: Colors.black, // Defina a cor roxa escuro aqui
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  // Outros estilos de texto, se necessário
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: 50, // Largura do botão ajustável conforme necessário
                height: 50, // Altura do botão ajustável conforme necessário
                decoration: BoxDecoration(
                  color: Colors.purple, // Cor de fundo roxo
                  borderRadius: BorderRadius.circular(10), // Bordas arredondadas
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/shop_page');
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white, // Cor do ícone branca para contraste
                    size: 30, // Tamanho do ícone ajustável conforme necessário
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
