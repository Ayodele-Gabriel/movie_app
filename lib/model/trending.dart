import 'package:flutter/material.dart';
import 'package:movie_app/pages/movie_info.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies(this.trending, {Key? key}) : super(key: key);

  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MovieInfo(
                            name: trending[index]['title'],
                            description: trending[index]['overview'],
                            bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                trending[index]['backdrop_path'],
                            vote: trending[index]['vote_average'].toString(),
                            launchOn: trending[index]['release_date'],
                          );
                        },
                      ),
                    );
                  },
                  child:  trending[index]['title']!=null?Container(
                    padding: const EdgeInsets.all(10.0),
                    width: 147,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
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
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(trending[index]['title'] ?? 'loading'),
                      ],
                    ),
                  ): Container(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

