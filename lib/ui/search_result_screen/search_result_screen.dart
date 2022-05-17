import 'package:filmoteka/ui/full_overview_movie_screen/bloc/full_overview_movie_bloc.dart';
import 'package:filmoteka/ui/full_overview_movie_screen/full_overview_movie_screen.dart';
import 'package:filmoteka/ui/search_result_screen/bloc/search_result_bloc.dart';
import 'package:filmoteka/ui/search_result_screen/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullOverviewMovieBloc =
        BlocProvider.of<FullOverviewMovieBloc>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Search Result'),
          backgroundColor: const Color.fromRGBO(3, 37, 65, 1),
        ),
        body: BlocBuilder<SearchResultBloc, SearchResultState>(
          builder: (context, state) {
            if (state is SearchResultInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SearchResultSuccessState) {
              return ListView.builder(
                itemCount: state.movie.length,
                itemBuilder: (context, index) {
                  final movie = state.movie[index];

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            if (movie.id != null) {
                              fullOverviewMovieBloc.add(
                                  FullOverviewMovieLoadedEvent(
                                      id: movie.id.toString()));
                            }
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const FullOverviewMovie(),
                              ),
                            );
                          },
                          child: CustomCardWidget(
                            pathImage: movie.image.toString(),
                            nameFilm: movie.title.toString(),
                            dataRelease: movie.releaseDate.toString(),
                            description: movie.plot.toString(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (state is SearchResultFailureState) {
              return Center(
                child: Text(state.error.toString()),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
