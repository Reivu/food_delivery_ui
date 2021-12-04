import 'package:flutter/material.dart';

class TopIcons extends StatelessWidget {
  const TopIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notes_rounded,
              size: 32.0,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}
