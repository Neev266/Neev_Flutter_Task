// import 'package:flutter/material.dart';
// import 'package:flutter_app/Pages/api_service.dart';
// import 'package:flutter_app/Pages/movie_model.dart';

// class Movies extends StatefulWidget {
//   const Movies({super.key});

//   @override
//   State<Movies> createState() => _MoviesState();
// }



// class _MoviesState extends State<Movies> {
//   Movie? _movie;
//   bool _isLoading = true;
//   String? _error;

//   @override
//   void initState() {
//     super.initState();
//     _loadMovie();
//   }

//   void _loadMovie() async {
//     setState(() {
//       _isLoading = true;
//       _error = null;
//     });

//     try {
//       final movie = await fetchMovie();
//       setState(() {
//         _movie = movie;
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _error = e.toString();
//         _isLoading = false;
//       });
//     }
//   }

//   void _shuffleMovie() {
//     _loadMovie();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: _isLoading
//             ? const Center(
//                 child: CircularProgressIndicator(color: Colors.green),
//               )
//             : _error != null
//                 ? Center(
//                     child: Text('Error: $_error',
//                         style: const TextStyle(color: Colors.red)),
//                   )
//                 : _movie == null
//                     ? const Center(
//                         child: Text('No movie found',
//                             style: TextStyle(color: Colors.white)),
//                       )
//                     : _buildMovieDetails(_movie!), // You move your movie UI code here
//       ),
//     );
//   }

//   Widget _buildMovieDetails(Movie movie) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             SizedBox(
//                 width: 400,
//                 height: 780,
//                 child: Container(
//                    decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.grey[900],
//                   ),
//                   child:  Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: Text(
//                         movie.title,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
                          
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: SizedBox(
//                         child: Image.network(
//                           movie.poster,
//                           width: 400,
//                           height: 150,
//                           fit: BoxFit.cover,
                          
//                           ),
                          
//                       ),
//                     ),
//                     SizedBox(height: 5,),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
//                       child: Row(
//                         children: [
//                           Text(
//                             movie.year,
//                             style: TextStyle(
//                               color: Colors.lightGreenAccent,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Text(
//                             movie.runtime,
//                             style: TextStyle(
//                               color: Colors.lightGreenAccent,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Text(
//                             movie.rated,
//                             style: TextStyle(
//                               color: Colors.lightGreenAccent,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 5,),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
//                       child: Row(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.fromLTRB(15,5,15,5),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.green[900],
//                             ),
//                             child: Text(
//                               'Action',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.lightGreenAccent
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 10,),
//                           Container(
//                             padding: EdgeInsets.fromLTRB(15,5,15,5),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.green[900],
//                             ),
                            
//                             child: Text(
//                               'Crime',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.lightGreenAccent
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
//                         child: Row(
//                           children: [
//                             Icon(
//                                Icons.star,
//                                color: Colors.green,
//                                size: 30,
//                             ),
//                             SizedBox(width: 9,),
//                             Text(
//                               movie.imdbRating,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                               ),
//                               ),
//                             SizedBox(width: 7,),
//                             Text(
//                               movie.imdbVotes,
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: Colors.white,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 5,),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(7,0,0,0),
//                         child: Container(
//                             padding: EdgeInsets.fromLTRB(15,5,15,5),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.green[900],
//                             ),
//                             child: Text(
//                               movie.genre,
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.lightGreenAccent
//                               ),
//                             ),
//                           ),
//                       ),
//                         SizedBox(height: 5,),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.person,
//                                 color: Colors.green,
//                                 size: 30,
//                               ),
//                               SizedBox(width: 15,),
//                               Text(
//                                 'Director: ',
//                                 style: TextStyle(
//                                   color: Colors.green,
//                                   fontSize: 20,
//                                 ),
//                                 ),
//                                 Text(
//                                 movie.director,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                 ),
//                                 ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 5,),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.edit,
//                                 color: Colors.green,
//                               ),
//                               SizedBox(width: 15,),
//                               Text(
//                                 'Writers: ',
//                                 style: TextStyle(
//                                   color: Colors.green,
//                                   fontSize: 20,
//                                 ),
//                                 ),
//                                 Expanded(
//                                   child: Text(
//                                   movie.writer, 
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20,
//                                   ),
//                                   ),
//                                 )
                              
//                             ],
//                           ),
//                         ),
                        
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(10,10,10,10),
//                         child: SizedBox(
//                           width: 400,
//                           height: 200,
//                           child: Container(
//                             color: Colors.black,
//                             padding: EdgeInsets.all(15),
//                             child: Text(
//                               movie.plot,
//                                style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
                                
//                                ),
//                               ),
//                           )
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(15,0,0,0),
//                             child: Container(
//                             child: Row(
                              
//                             children: [
//                               Icon(
//                               Icons.language,
//                               color: Colors.white,
//                               size: 25,
//                             ),
//                             SizedBox(width: 10,),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Language: ',
//                                   style: TextStyle(
//                                     color: Colors.green,
//                                     fontSize: 16,
//                                   ),
//                                   ),
//                                 Text(
//                                   movie.language,
//                                    style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 18
//                                    ),
//                                   )
//                               ],
//                             )
//                            ],
//                            ),
//                            ),
//                           ),
//                       SizedBox(width: 100,),
//                       Container(
//                         child: Row(
//                           children: [
//                             Icon(
//                           Icons.public,
//                           color: Colors.white,
//                           size: 25,
//                          ),
//                          SizedBox(width: 10,),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Country: ',
//                                 style: TextStyle(
//                                   color: Colors.green,
//                                   fontSize: 16,
//                                 ),
//                                 ),
//                               Text(
//                                 movie.country,
//                                  style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18
//                                  ),
//                                 )
//                             ],
//                           )
//                         ],
//                         ),
//                       )
//                       ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(10,0,0,0),
//                         child: Row(
//                           children: [
//                             Icon(
//                           Icons.public,
//                           color: Colors.white,
//                           size: 25,
//                          ),
//                          SizedBox(width: 10,),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Awards: ',
//                                 style: TextStyle(
//                                   color: Colors.green,
//                                   fontSize: 16,
//                                 ),
//                                 ),
//                               Text(
//                                 movie.awards,
//                                  style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18
//                                  ),
//                                 )
//                             ],
//                           )
//                         ],
//                         ),
//                       ),
//                     ],
                  
//                   )
//                   ),
//                 ),
//                 SizedBox(height: 5,),
//             SizedBox(
//               width: 900,
//               height: 35,
//               child: ElevatedButton(
//                 onPressed: _shuffleMovie,
//                 style: ButtonStyle(
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(Colors.green),
//                 ),
//                 child: const Text(
//                   'Shuffle',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
