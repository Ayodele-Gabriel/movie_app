import 'package:flutter/material.dart';
import 'package:movie_app/utilities/cast_crew.dart';
import 'package:movie_app/utilities/colors.dart';

import '../utilities/constants.dart';
import '../utilities/text_used.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.zero, // Image border
                child: SizedBox.fromSize(
                  size: Size.copy(
                    const Size(
                      470.0,
                      310.5,
                    ),
                  ), // Image radius
                  child:
                      Image.asset('assets/images/ford2.png', fit: BoxFit.cover),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 10.0),
                    child: SafeArea(
                      child: InkResponse(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 150.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 32.0),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        bottomLeft: Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 20.0, top: 18.0, bottom: 19.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/icons/filled_star.png',
                                width: 32.0,
                                height: 32.0,
                              ),
                              const SizedBox(height: 4.0,),
                              Row(
                                children: const[
                                  Text(
                                    '8.2',
                                    style: kText8,
                                  ),
                                  Text(
                                    '/10',
                                    style: kText11,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2.0,),
                              const Text(
                                '150,212',
                                style: kText12,
                              ),
                            ],
                          ),
                         const SizedBox(width: 52.0,),
                          Column(
                            children: [
                              InkResponse(
                                onTap: (){},
                                child: Image.asset(
                                  'assets/icons/star.png',
                                  width: 32.0,
                                  height: 32.0,
                                ),
                              ),
                              const SizedBox(height: 4.0,),
                              const Text(
                                'Rate This',
                                style: kText8,
                              ),
                            ],
                          ),
                          const SizedBox(width: 30.0,),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 28.0,
                                  height: 24.0,
                                  decoration: const BoxDecoration(
                                    color: MovieColors.metaScore,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '86',
                                      style: kText13,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 9.0,),
                                const Text(
                                  'Metascore',
                                  style: kText8,
                                ),
                                const SizedBox(height: 2.0,),
                                const Text(
                                  '62 critic reviews',
                                  style: kText12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Ford v Ferrari',
                                style: kText1,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    '2019',
                                    style: kText10,
                                  ),
                                  SizedBox(
                                    width: 28.0,
                                  ),
                                  Text(
                                    'PG-13',
                                    style: kText10,
                                  ),
                                  SizedBox(
                                    width: 24.0,
                                  ),
                                  Text(
                                    '2h 32min',
                                    style: kText10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Image.asset(
                            'assets/icons/add.png',
                            width: 64.0,
                            height: 64.0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: const [
                          TextUsed3(text: 'Action'),
                          kSpace2,
                          TextUsed3(text: 'Biography'),
                          kSpace2,
                          TextUsed3(text: 'Drama'),
                        ],
                      ),
                      const SizedBox(
                        height: 48.0,
                      ),
                      const Text(
                        'Plot Summary',
                        style: kText5,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const Text(
                        'American car designer Carroll Shelby and driver '
                        'Kn Miles battle corporate interference and the laws '
                        'of physics to build a revolutionary race car for Ford in order.',
                        style: kText6,
                      ),
                      const SizedBox(
                        height: 48.0,
                      ),
                      const Text(
                        'Cast & Crew',
                        style: kText7,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        children: const [
                          CastCrew(
                              image: 'assets/images/james.png',
                              name: '  James \n Mangold',
                              role: 'Director'),
                          Spacer(),
                          CastCrew(
                              image: 'assets/images/matt.png',
                              name: '  Matt \nDamon',
                              role: 'Ken Miles'),
                          Spacer(),
                          CastCrew(
                              image: 'assets/images/christian.png',
                              name: '  Christian \n      Bale',
                              role: 'Carrol'),
                          Spacer(),
                          CastCrew(
                              image: 'assets/images/caitriona.png',
                              name: '  Caitriona \n     Balfe',
                              role: 'Molie'),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
