import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_app/model/animated_image.dart';
import 'package:movie_app/services/movie_services.dart';
import 'package:movie_app/utilities/constants.dart';
import 'package:movie_app/utilities/text_used.dart';

import '../utilities/colors.dart';
import 'movie_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  final int _currentPage = 0;

  // List<AnimatedImage>? movies;
  // var isLoaded = false;

  @override
  void initState() {
    super.initState();
    //getMovie();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  // getMovie() async {
  //   movies = await MovieService().getMovies();
  //   if (movies != null) {
  //     setState(
  //           () {
  //         isLoaded = true;
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/icons/menu.png'),
                  const Icon(
                    Icons.search,
                    color: MovieColors.text2,
                  ),
                ],
              ),
              const SizedBox(
                height: 54.0,
              ),
              SizedBox(
                height: 39.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    TextUsed1(text: 'In Theater'),
                    kSpace1,
                    TextUsed1(text: 'Box Office'),
                    kSpace1,
                    TextUsed1(text: 'Coming Soon'),
                  ],
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Container(
                width: 40.0,
                height: 6.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: MovieColors.rectangle,
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 40.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          TextUsed2(text: 'Action'),
                          kSpace2,
                          TextUsed2(text: 'Crime'),
                          kSpace2,
                          TextUsed2(text: 'Comedy'),
                          kSpace2,
                          TextUsed2(text: 'Drama'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      width: 310.0,
                      height: 458.92,
                      child: AspectRatio(
                        aspectRatio: 0.85,
                        child: PageView.builder(
                          itemCount: animatedList.length,
                          physics: const ClampingScrollPhysics(),
                          controller: _pageController,
                          itemBuilder: (context, index) {
                            return carouselView(index);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40.08,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = value * 0.038.clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(
            animatedList[index],
          ),
        );
      },
    );
  }

  Widget carouselCard(AnimatedImage animatedImage) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MovieInfo(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(
                    image: AssetImage(
                      animatedImage.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black26,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Text(
          animatedImage.title,
          style: kText1,
        ),
        const SizedBox(
          height: 9.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/filled_star.png',
              width: 16.63,
              height: 15.84,
            ),
            const SizedBox(
              width: 9.6,
            ),
            Text(
              animatedImage.rating,
              style: kText3,
            ),
          ],
        )
      ],
    );
  }
}
