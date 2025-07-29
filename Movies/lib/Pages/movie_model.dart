
class Movie{
  
  final String awards;
  final String country;
  final String director;
  final String genre;
  final String language;
  final String plot;
  final String poster;
  final String rated;
  final String released;
  final String runtime;
  final String title;
  final String writer;
  final String year;
  final String imdbRating;
  final String imdbVotes;


  Movie({
  
  required this.awards,
  required this.country,
  required this.director,
  required this. genre,
  required this.language,
  required this.plot,
  required this.poster,
  required this.rated,
  required this.released,
  required this.runtime,
  required this.title,
  required this.writer,
  required this.year,
  required this.imdbRating,
  required this.imdbVotes,
  });

  factory Movie.fromJson(Map<String,dynamic>json){
    return Movie(
      title: json['title']??'', 
      awards: json['awards']??'',
       country: json['country']??'',
       director: json['director']??'',
       genre: json['genre']??'',
       language: json['lang']??'',
       plot: json['plot']??'',
       poster: json['poster']??'',
       rated: json['rated']??'',
       released: json['released']??'',
       runtime: json['time']??'',
       writer: json['writer']??'',
       year: json['year']??'',
       imdbRating: json['imdbrating'].toString(),
       imdbVotes: json['imdbvotes']??'',

      
      
    );
  }
   
  
}

