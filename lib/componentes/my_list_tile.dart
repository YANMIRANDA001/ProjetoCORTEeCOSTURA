import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {

  final String text;
  final IconData icon;
  final void Function()? onTap;

  const MyListTile({
  super.key, 
  required this.text,
  required this.icon, 
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      title: Text(text),
      onTap: onTap,
    );
  }
}