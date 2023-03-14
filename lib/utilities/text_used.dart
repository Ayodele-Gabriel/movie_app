import 'package:flutter/material.dart';
import 'package:movie_app/utilities/colors.dart';

import 'constants.dart';

class TextUsed1 extends StatelessWidget {
  const TextUsed1({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {},
      child: Text(
        text,
        style: kText1,
      ),
    );
  }
}

class TextUsed2 extends StatelessWidget {
  const TextUsed2({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {},
      child: Container(
        width: 105.0,
        height: 40.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: MovieColors.text1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: kText2,
          ),
        ),
      ),
    );
  }
}

class TextUsed3 extends StatelessWidget {
  const TextUsed3({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {},
      child: Container(
        width: 100.0,
        height: 40.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: MovieColors.text1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: kText3,
          ),
        ),
      ),
    );
  }
}
