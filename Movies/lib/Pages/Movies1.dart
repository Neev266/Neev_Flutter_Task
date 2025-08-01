import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/api_service.dart';
import 'package:flutter_app/Pages/movie_model.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {

  late Future<Movie> _movie;
  

  @override
  void initState() {
    super.initState();
    _movie = fetchMovie();
  }

  void _shuffleMovie() {
    setState(() {
      _movie = fetchMovie();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FutureBuilder(
          future: _movie,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.green));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.red)));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No movie found', style: TextStyle(color: Colors.white)));
          }

         final movie = snapshot.data!;
         List<String> wordList = movie.genreList;

         return SingleChildScrollView(
           child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                
                child: Container(
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[900],
                  ),
                  child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Center(
                        child: Text(
                          movie.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        child: Image.network(
                          movie.poster,
                          width: 400,
                          fit: BoxFit.cover,
                          
                          ),
                          
                      ),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                      child: Row(
                        children: [
                          Text(
                            movie.year,
                            style: TextStyle(
                              color: Colors.lightGreenAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            movie.runtime,
                            style: TextStyle(
                              color: Colors.lightGreenAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            movie.rated,
                            style: TextStyle(
                              color: Colors.lightGreenAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0,),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Wrap(
                        spacing: 10,
                        
                        children: wordList.map((word) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green[900],
                            ),
                            child: Text(
                              word,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.lightGreenAccent,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                        child: Row(
                          children: [
                            Icon(
                               Icons.star,
                               color: Colors.green,
                               size: 30,
                            ),
                            SizedBox(width: 9,),
                            Text(
                              movie.imdbRating,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              ),
                            SizedBox(width: 7,),
                            Text(
                              "(${movie.imdbVotes} Votes)",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.green,
                                size: 30,
                              ),
                              SizedBox(width: 15,),
                              Text(
                                'Director: ',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                ),
                                ),
                                Expanded(
                                  child: Text(
                                  movie.director,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                              SizedBox(width: 15,),
                              Text(
                                'Writers: ',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                ),
                                ),
                                Expanded(
                                  child: Text(
                                  movie.writer, 
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  ),
                                )
                              
                            ],
                          ),
                        ),
                        
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,10,10,10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          
                          child: Container(
                            color: Colors.black,
                            padding: EdgeInsets.all(15),
                            child: Text(
                              movie.plot,
                               style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                
                               ),
                              ),
                          )
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15,0,0,0),
                            child: Row(
                            children: [
                              Icon(
                              Icons.language,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(width: 10,),
                            Text(
                              'Language: ',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                              ),
                              ),
                            Expanded(
                              child: Text(
                                movie.language,
                                 style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                 ),
                                ),
                            )
                            ],
                            ),
                          ),
                      SizedBox(width: 100,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15,0,0,0),
                        child: Row(
                          children: [
                          Icon(
                          Icons.public,
                          color: Colors.white,
                          size: 25,
                         ),
                         SizedBox(width: 10,),
                          Text(
                            'Country: ',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                            ),
                            ),
                          Expanded(
                            child: Text(
                              movie.country,
                               style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                               ),
                              ),
                          )
                        ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15,0,0,0),
                        child: Row(
                          children: [
                            Icon(
                          Icons.public,
                          color: Colors.white,
                          size: 25,
                         ),
                         SizedBox(width: 10,),
                          Text(
                            'Awards: ',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                            ),
                            ),
                          Expanded(
                            child: Text(
                              movie.awards,
                              
                               style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                               ),
                              ),
                          )
                        ],
                        ),
                      ),

                      ],
                      ),
                      
                    ],
                  
                  )
                  ),
                ),
                SizedBox(height: 5,),
                SizedBox(
                  width:900,
                  height: 35,
                  child: ElevatedButton(
                   onPressed: () {
                    _shuffleMovie();
                   },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
                    
                  ), 
                  child: Text(
                    'Shuffle',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  ),
                )
              ],
            ),
            
                   ),
         );
        }
        ),
      ),
    );
  }
}
