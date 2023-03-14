import 'dart:convert';

import 'package:flutter/material.dart';


class AnimatedImage {
  const AnimatedImage({Key? key,
    required this.image,
    required this.title,
    required this.rating});

  final String image;
  final String title;
  final String rating;
}

//   factory AnimatedImage.fromJson(Map<String, dynamic> json) => AnimatedImage(
//     title: json["title/find"],
//     image: json["title/get-images"],
//     rating: json["title/get-ratings"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "title": title,
//     "image": image,
//     "rating": rating,
//   };
//
// }
//
// List<AnimatedImage> postFromJson(String str) => List<AnimatedImage>.from(json.decode(str).map((x) => AnimatedImage.fromJson(x)));
//
// String postToJson(List<AnimatedImage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<AnimatedImage> animatedList = const [
  AnimatedImage(
    image: 'assets/images/wick.jpeg',
    title: 'John Wick 4',
    rating: '7.4',
  ),
  AnimatedImage(
    image: 'assets/images/ford.png',
    title: 'Ford v Ferrari',
    rating: '8.2',
  ),
  AnimatedImage(
    image: 'assets/images/gray.jpeg',
    title: 'The Gray Man',
    rating: '9.0',
  ),
];
