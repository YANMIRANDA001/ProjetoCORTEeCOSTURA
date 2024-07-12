import 'package:flutter/material.dart';
import '../componentes/my_drawer.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9932CC), // Define a cor de fundo da appbar como roxo
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'TECH INOVA', // Título principal da aplicação
              style: TextStyle(
                fontSize: 18, // Tamanho da fonte
                fontWeight: FontWeight.bold, // Negrito
              ),
            ),
            Text(
              'CORTE E COSTURA', // Subtítulo da aplicação
              style: TextStyle(
                fontSize: 14, // Tamanho da fonte
                fontWeight: FontWeight.w400, // Peso da fonte
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Ícone de seta para voltar
          onPressed: () {
            Navigator.of(context).pop(); // Função para voltar à tela anterior
          },
        ),
      ),
      drawer: const MyDrawer(), // Inclui um drawer personalizado
      body: SingleChildScrollView( // SingleChildScrollView permite a rolagem da tela
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextWithImageContainer(
              'Apoiamos Empreendedoras', // Título da seção
              'Bem-vindo à Tech Inova! Não vendemos apenas roupas e acessórios; estamos construindo um caminho para o empreendedorismo e o empoderamento feminino. Cada compra apoia diretamente mulheres empreendedoras.', // Texto da seção
              'assets/mulher-costurando-roupra-preta.JPG', // Caminho da imagem
              true, // Define o texto à esquerda e a imagem à direita
            ),
            SizedBox(height: 20), // Define um espaço entre as seções
            _buildTextWithImageContainer(
              'Curso Profissional de Costura', // Título da seção
              'Oferecemos cursos de costura com máquinas reta e overloque. Aprenda a cortar, costurar e fazer acabamento em tecidos, promovendo autonomia e desenvolvimento de habilidades.', // Texto da seção
              'assets/mulher-costurando.JPG', // Caminho da imagem
              false, // Define o texto à direita e a imagem à esquerda
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir um container com texto e imagem
  Widget _buildTextWithImageContainer(
    String title, // Título da seção
    String text, // Texto da seção
    String imagePath, // Caminho da imagem
    bool textLeft, // Booleano para determinar a posição do texto (esquerda ou direita)
  ) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3E5F5), // Define a cor de fundo do container como roxo claro
        borderRadius: BorderRadius.circular(10.0), // Define um raio para as bordas do container
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Define a cor da sombra
            spreadRadius: 1, // Espalhamento da sombra
            blurRadius: 3, // Desfoque da sombra
            offset: const Offset(0, 2), // Define a posição da sombra
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Define as margens do container
      padding: const EdgeInsets.all(16.0), // Define o preenchimento interno do container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title, // Exibe o título da seção
            style: TextStyle(
              fontSize: 20, // Tamanho da fonte do título
              fontWeight: FontWeight.bold, // Negrito do título
              color: const Color(0xFF6A1B9A), // Define a cor do título como roxo escuro
            ),
          ),
          SizedBox(height: 8), // Define um espaço entre o título e o texto
          Text(
            text, // Exibe o texto da seção
            textAlign: TextAlign.justify, // Alinha o texto justificado
            style: TextStyle(
              fontSize: 16, // Tamanho da fonte do texto
              color: Colors.black87, // Define a cor do texto como preto
            ),
            maxLines: 10, // Limita o texto a 10 linhas
            overflow: TextOverflow.ellipsis, // Aplica reticências ao final do texto se ultrapassar as 10 linhas
          ),
          SizedBox(height: 8), // Espaço entre o texto e a imagem
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0), // Define um raio para as bordas da imagem
            child: Image.asset(
              imagePath, // Exibe a imagem da seção
              fit: BoxFit.cover, // Ajusta a imagem para cobrir o espaço disponível
            ),
          ),
        ],
      ),
    );
  }
}
