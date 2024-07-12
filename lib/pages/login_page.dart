import 'package:flutter/material.dart';
import '../componentes/login_button.dart';
import '../componentes/my_text_field.dart';
import '../componentes/square_tile.dart';
import '../componentes/my_drawer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
      drawer: const MyDrawer(),
      backgroundColor: const Color(0xFFDDA0DD), // Roxo mais claro
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                SquareTile(
                      imagePath:
                          "https://firebasestorage.googleapis.com/v0/b/projetovander.appspot.com/o/logo2.png?alt=media&token=7047ce7a-43dc-47a5-aed4-636aafc7054d",
                      onTap: () {},
                    ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.transparent, // Cor transparente para manter o layout
                ),
                const SizedBox(height: 50),
                Text(
                  "Que bom que você voltou!",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  hintText: "e-mail",
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: "Senha",
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Esqueceu a senha?",
                        style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                LoginButton(onTap: () {}, text: "Entrar"),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "ou",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      imagePath:
                          "https://firebasestorage.googleapis.com/v0/b/projetovander.appspot.com/o/WhatsApp%20Image%202024-06-05%20at%2009.37.16%20(1).jpeg?alt=media&token=941bb38a-5c92-4a08-8c7d-20a50f20864b",
                      onTap: () {},
                    ),
                    const SizedBox(width: 25),
                    SquareTile(
                      imagePath:
                          "https://firebasestorage.googleapis.com/v0/b/projetovander.appspot.com/o/WhatsApp%20Image%202024-06-05%20at%2009.37.16.jpeg?alt=media&token=7996b8ea-0fec-4b75-b7c4-2f37174f622f",
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ainda não possui conta?",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Registre-se",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
