import 'package:case_study/widgets/custom_image_widget.dart';
import 'package:case_study/widgets/rounds.dart';
import 'package:flutter/material.dart';

class HomeBodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16, left: 16, top: 20),
          child: CustomImageWidget(
            imageUrl:
                "https://images.unsplash.com/photo-1528728329032-2972f65dfb3f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80",
          ),
          //DepartureTimesWidget(),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          margin: const EdgeInsets.only(top: 24, left: 16, bottom: 12),
          child: Text(
            'Departure Times',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Rounds(),
      ],
    );
  }
}
