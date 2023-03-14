import 'package:flutter/material.dart';
import 'package:movie_app/utilities/constants.dart';

class CastCrew extends StatelessWidget {
  const CastCrew(
      {Key? key, required this.image, required this.name, required this.role})
      : super(key: key);

  final String image;
  final String name;
  final String role;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(image),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Center(
          child: Text(name, style: kText8,),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Center(
          child: Text(role, style: kText9,),
        ),
      ],
    );
  }
}
