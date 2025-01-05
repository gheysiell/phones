import 'package:flutter/material.dart';
import 'package:phones/shared/palette.dart';

class NotFoundWidget extends StatelessWidget {
  final String title;

  const NotFoundWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Container(
          alignment: Alignment.center,
          height: 150,
          width: 150,
          child: Image.asset(
            'assets/images/icon.png',
            height: 200,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Palette.gray,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        const Spacer(),
      ],
    );
  }
}
