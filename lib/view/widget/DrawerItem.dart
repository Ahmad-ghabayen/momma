import 'package:flutter/material.dart';
class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key, required this.name, required this.icon, this.onTap});

  final String name;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            onPrimary: Colors.blueAccent,
            alignment: Alignment.centerLeft,
             padding: const EdgeInsets.all(10),
            elevation: 0),

        onPressed: onTap,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(
          name,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}