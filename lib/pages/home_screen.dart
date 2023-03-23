import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_app/model/trending.dart';
import 'package:movie_app/utilities/constants.dart';
import 'package:movie_app/utilities/text_used.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../utilities/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List trendingMovies = [];
  // List inTheater = [];
  // List boxOffice = [];
  // List comingSoon = [];
  // List action = [];
  // List crime = [];
  // List comedy = [];
  // List drama = [];

  final String apiKey = '1e85a4ab93e11d7ee0fc13592e2939bc';
  final String readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZTg1YTRhYjkzZTExZDdlZTBmYzEzNTkyZTI5MzliYyIsInN1YiI6IjY0MTgzZDM5NTY5MGI1MDBkNDAxZDdmNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BF8omNkDz2VRkjonwoA48EHyrTCtwL-R-DqD6084FbI';

  late PageController _pageController;
  final int _currentPage = 0;


  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    // Map inTheaterResult = await tmdbWithCustomLogs.v3.movies.getLatest();
    // Map boxOfficeResult = await tmdbWithCustomLogs.v3.movies.getPopular();
    // Map comingSoonResult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    // Map actionResult = await tmdbWithCustomLogs.v3.genres.getMovieList(language: 'Action');
    // Map crimeResult = await tmdbWithCustomLogs.v3.genres.getMovieList(language: 'Crime');
    // Map comedyResult = await tmdbWithCustomLogs.v3.genres.getMovieList(language: 'Comedy');
    // Map dramaResult = await tmdbWithCustomLogs.v3.genres.getMovieList(language: 'Drama');

    setState(() {
      trendingMovies = trendingResult['results'];
      // inTheater = inTheaterResult['results'];
      // boxOffice = boxOfficeResult['results'];
      // comingSoon = comingSoonResult['results'];
      // action = actionResult['results'];
      // crime = crimeResult['results'];
      // comedy = comedyResult['results'];
      // drama = dramaResult['results'];
    });
    //print(trendingMovies);
  }

  @override
  void initState() {
    super.initState();
    loadMovies();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

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
                        child: TrendingMovies(trendingMovies),
                        // PageView.builder(
                        //   itemCount: trendingMovies.length,
                        //   physics: const ClampingScrollPhysics(),
                        //   controller: _pageController,
                        //   itemBuilder: (context, index) => carouselView(index),
                        // ),
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
          child: TrendingMovies(trendingMovies),
        );
      },
    );
  }
}

