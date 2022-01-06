// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import '../constants.dart';

class CustomDepartureList extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String>? days;

  CustomDepartureList(
      {required this.icon, required this.title, required this.days});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(color: cardLineColor),
      )),
      child: ListTile(
        title: Row(
          children: [
            Icon(
              icon,
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
                  days.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
      // trailing: Text(
      //   departures.items[i].title,
      //   style: TextStyle(
      //     fontSize: 12,
      //     fontFamily: 'Roboto',
      //   ),
      // ),
    );
  }
}
