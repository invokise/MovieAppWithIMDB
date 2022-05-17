import 'package:filmoteka/constants/text_styles.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String pathImage;
  final String nameFilm;
  final String dataRelease;
  final String description;
  const CustomCardWidget({
    Key? key,
    required this.pathImage,
    required this.nameFilm,
    required this.dataRelease,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final cardConstraints = MediaQuery.of(context).size.height * 0.38;

      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: cardConstraints * 0.8,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: AspectRatio(
                    aspectRatio: 0.7,
                    child: Image.network(
                      pathImage,
                      errorBuilder: (_, __, ___) {
                        return Image.asset(
                          'assets/background.png',
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: constraints.maxWidth * 0.5,
                    child: Center(
                      child: Text(
                        nameFilm,
                        style: AppTextStyles.blackBold15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(dataRelease),
                  Flexible(
                    child: SizedBox(
                      width: constraints.maxWidth * 0.5,
                      child: Text(
                        description,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
