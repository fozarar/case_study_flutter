// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ListTileDepartures extends StatelessWidget {
  final String title;
  final String icon;
  final String title2;

  ListTileDepartures(this.title, this.icon, this.title2);

  get redLightBG => null;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(
            icon == "Night" ? Icons.bedtime : Icons.wb_sunny,
            color: redLightBG,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700),
              ),
              Text(
                title2,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
