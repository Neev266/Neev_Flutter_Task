import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie_model.dart';

Future<Movie> fetchMovie() async{
  final url = Uri.parse('https://flutterucinterviewtask.onrender.com/random');
  final response = await http.get(url);

  if(response.statusCode==200){
    final data = jsonDecode(response.body);
    print(data);
    return Movie.fromJson(data);
  } else {
    throw Exception('Failed to load movie');
  }
  
}  