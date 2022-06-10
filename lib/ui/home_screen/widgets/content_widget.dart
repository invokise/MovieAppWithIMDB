import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmoteka/models/movies_model/movies_model.dart';
import 'package:filmoteka/ui/full_overview_movie_screen/bloc/full_overview_movie_bloc.dart';
import 'package:filmoteka/ui/full_overview_movie_screen/full_overview_movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentWidget extends StatelessWidget {
  final Movies movies;
  const ContentWidget({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullOverviewMovieBloc =
        BlocProvider.of<FullOverviewMovieBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3.2,
        child: ListView.separated(
          separatorBuilder: (context, _) => const SizedBox(
            width: 15,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 30,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 100,
              child: InkWell(
                onTap: () {
                  if (movies.items?[index].id != null) {
                    fullOverviewMovieBloc.add(FullOverviewMovieLoadedEvent(
                        id: movies.items![index].id.toString()));
                  }

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FullOverviewMovie(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AspectRatio(
                        aspectRatio: 0.7,
                        child: CachedNetworkImage(
                          imageUrl: movies.items![index].image.toString(),
                          errorWidget: (_, __, ___) {
                            return Container();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Text(movies.items![index].title.toString()),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
