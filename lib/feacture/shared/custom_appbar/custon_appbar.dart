import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:cinemapedia/domain/entities/movie.dart';
// import 'package:cinemapedia/presentation/providers/providers.dart';
// import 'package:cinemapedia/presentation/delegates/search_delegate_movie.dart';
// import 'package:go_router/go_router.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef  ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              Icons.movie_outlined,
              color: colors.primary,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Cinemapedia',
              style: titleStyle,
            ),
            const Spacer(),
            IconButton(onPressed: ()  {
              // //* esto se encarga de buscar las peliculas y ralizar las peticiones http
              // final searchQuery= ref.read(searchQueryProvider);
              // //* esto se encarga de almacenar los resultados de las peliculas para mostrarlas con anticipacion
              // final searchesMovies= ref.read(searchedMoviesProvider);
              // showSearch<Movie?>(
              // query: searchQuery,
              // context: context, 
              // delegate: SearchMovieDelegate(
              //   searchMovies: ref.read(searchedMoviesProvider.notifier).searcMoviesByQuery,
              //    //* ejemplo de query sin guardar preferencias
              //   // (query) {
              //   // ref.read(searchQueryProvider.notifier).update((state) => query);
              //   // return movieRepository.seachMovie(query);
              //   // }
                
              //   initialMovie: searchesMovies,
               
              //   )
              // ).then((movie) {
              //   if(movie == null) return;
              //   context.push('/home/0/movie/${movie.id}');
              // });
              // print(movie?.title);
            
              

            }, icon: const Icon(Icons.search))
          ],
        ),
      ),
    ));
  }
}
