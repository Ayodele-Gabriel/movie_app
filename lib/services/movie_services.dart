// import 'package:http/http.dart' as http;
// import 'package:movie_app/model/animated_image.dart';
//
// class MovieService{
//   Future<List<AnimatedImage>?> getMovies() async{
//     var client = http.Client();
//     var uri = Uri.parse('online-movie-database.p.rapidapi.com');
//     var response = await client.get(uri);
//
//     if(response.statusCode == 200){
//       var json = response.body;
//       return postFromJson(json);
//     }
//     return null;
//   }
// }