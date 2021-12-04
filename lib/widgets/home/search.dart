import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const TextField(
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: 'Search for restaurant, food etc',
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
