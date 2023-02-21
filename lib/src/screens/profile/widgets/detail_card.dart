import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final String title;
  final String detail;

  const DetailCard({
    Key? key,
    required this.title,
    required this.detail,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        SizedBox(width: size.width * .1),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.normal,
                fontSize: 15
              ),
            ),
            Text(
              detail,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ]
        ),
      ],
    );
  }
}