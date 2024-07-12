import 'package:flutter/material.dart';


class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool _categoriasVisiveis = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF9932CC), // Roxo um pouco mais claro
              Color(0xFFDDA0DD), // Roxo claro
            ],
          ),
        ),
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Center(
                child: Image.asset(
                  'assets/logo.png',
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: const Text('Produtos', style: TextStyle(color: Colors.black)),
              leading: const Icon(Icons.shopping_bag, color: Colors.black),
              trailing: _categoriasVisiveis
                  ? const Icon(Icons.keyboard_arrow_up, color: Colors.black)
                  : const Icon(Icons.keyboard_arrow_down, color: Colors.black),
              onTap: () {
                setState(() {
                  _categoriasVisiveis = !_categoriasVisiveis;
                });
              },
            ),
            if (_categoriasVisiveis)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0), // Adiciona espaço à esquerda e à direita
                    child: ListTile(
                      title: const Text('Bolsas', style: TextStyle(color: Colors.black)),
                      leading: const Icon(Icons.wallet_giftcard, color: Colors.black),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/loja_page');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0), // Adiciona espaço à esquerda e à direita
                    child: ListTile(
                      title: const Text('Vestuário Superior', style: TextStyle(color: Colors.black)),
                      leading: const Icon(Icons.woman, color: Colors.black),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/loja1_page');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0), // Adiciona espaço à esquerda e à direita
                    child: ListTile(
                      title: const Text('Acessórios', style: TextStyle(color: Colors.black)),
                      leading: const Icon(Icons.watch, color: Colors.black),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, 'loja2_page');
                      },
                    ),
                  ),
                ],
              ),
            ListTile(
              title: const Text('Sobre nós', style: TextStyle(color: Colors.black)),
              leading: const Icon(Icons.info, color: Colors.black),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/sobre_page');
              },
            ),
            ListTile(
              title: const Text('Carrinho', style: TextStyle(color: Colors.black)),
              leading: const Icon(Icons.shopping_cart, color: Colors.black),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cart_page');
              },
            ),
            const Spacer(),
            ListTile(
              title: const Text('Sair', style: TextStyle(color: Colors.black)),
              leading: const Icon(Icons.logout, color: Colors.black),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/intro_page', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
