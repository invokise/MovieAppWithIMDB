import 'package:filmoteka/constants/text_styles.dart';
import 'package:filmoteka/ui/full_overview_movie_screen/bloc/full_overview_movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FullOverviewMovie extends StatelessWidget {
  const FullOverviewMovie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(3, 37, 65, 1),
            title: const Text('Full Overview'),
          ),
          body: BlocBuilder<FullOverviewMovieBloc, FullOverviewMovieState>(
              builder: (context, state) {
            if (state is FullOverviewMovieInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is FullOverviewMovieLoadedState) {
              final moviesTitle = state.moviesTitle;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: constraints.maxHeight / 2.2,
                          width: constraints.maxWidth / 2.5,
                          child: Image.network(
                            moviesTitle.image.toString(),
                            errorBuilder: (_, __, ___) {
                              return Image.asset(
                                'assets/background.png',
                                fit: BoxFit.fill,
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            moviesTitle.title.toString(),
                            style: AppTextStyles.blackBold18,
                          ),
                        ),
                        Text(
                          'Date of release: ${moviesTitle.releaseDate}',
                          style: AppTextStyles.blackBold15,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Overview',
                          style: AppTextStyles.blackBold15,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '    ${moviesTitle.plot}',
                            style: AppTextStyles.text15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else if (state is FullOverviewMovieFailureState) {
              return Center(child: Text(state.error.toString()));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        );
      }),
    );
  }
}
