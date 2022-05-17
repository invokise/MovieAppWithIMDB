import 'package:filmoteka/ui/home_screen/bloc/home_bloc.dart';
import 'package:filmoteka/ui/home_screen/widgets/content_widget.dart';
import 'package:filmoteka/ui/home_screen/widgets/search_field_widget.dart';
import 'package:filmoteka/ui/home_screen/widgets/title_of_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeAllMovieLoadedEvent()),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Movies'),
            backgroundColor: const Color.fromRGBO(3, 37, 65, 1),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(scrollDirection: Axis.vertical, children: [
                  const SearchFieldWidget(),
                  BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                    if (state is HomeInitial) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is HomeAllMoviesLoadedState) {
                      return Column(children: [
                        const TitleOfContentWidget(
                          nameTypeOfFilms: 'TopRated Movies',
                        ),
                        ContentWidget(movies: state.topMovies),
                        const SizedBox(height: 20),
                        const TitleOfContentWidget(
                            nameTypeOfFilms: 'Popular Movies'),
                        ContentWidget(movies: state.popularMovies),
                      ]);
                    } else if (state is HomeAllMoviesFailureState) {
                      return Center(
                        child: Text(state.error.toString()),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
