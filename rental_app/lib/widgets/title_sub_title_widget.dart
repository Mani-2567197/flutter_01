import 'package:flutter/material.dart';

class TitleSubTitleWidget extends StatelessWidget {
const TitleSubTitleWidget(
      {super.key, required this.title, required this.subHeading});
  final String title;
  final String subHeading;

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subHeading,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}