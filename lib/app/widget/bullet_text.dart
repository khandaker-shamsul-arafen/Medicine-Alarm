import 'package:flutter/material.dart';

class BulletText extends StatelessWidget {
  final String text;

  const BulletText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '\u2022',
          style: TextStyle(
            fontSize: 16,
            height: 1.55,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            child: Text(
              text,
              textAlign: TextAlign.left,
              softWrap: true,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                height: 1.55,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
