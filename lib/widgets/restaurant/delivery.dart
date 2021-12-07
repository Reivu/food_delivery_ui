import 'package:flutter/material.dart';

class Delivery extends StatelessWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          height: 20.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            children: const [
              Icon(
                Icons.timelapse_rounded,
                size: 11.0,
                color: Colors.red,
              ),
              SizedBox(width: 5.0),
              Text(
                '25 Mins',
                style: TextStyle(
                  fontSize: 11.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10.0),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          height: 20.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            children: const [
              Icon(
                Icons.delivery_dining_rounded,
                size: 11.0,
                color: Colors.red,
              ),
              SizedBox(width: 5.0),
              Text(
                'Free Delivery',
                style: TextStyle(
                  fontSize: 11.0,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
