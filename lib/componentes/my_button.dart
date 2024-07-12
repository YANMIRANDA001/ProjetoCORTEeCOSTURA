import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final Color backgroundColor;

  const MyButton({
    Key? key,
    required this.onTap,
    required this.child,
    this.backgroundColor = Colors.blue, // Defina a cor padrão aqui
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor, // Usando a cor de fundo fornecida
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(25),
        child: child,
      ),
    );
  }
}
