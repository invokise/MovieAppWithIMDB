import 'package:filmoteka/constants/text_styles.dart';
import 'package:filmoteka/ui/search_result_screen/bloc/search_result_bloc.dart';
import 'package:filmoteka/ui/search_result_screen/search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({Key? key}) : super(key: key);

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Column(
      children: [
        Image.asset(
          'assets/main.jpg',
          fit: BoxFit.cover,
        ),
        Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: SizedBox(
              height: 85,
              child: Stack(children: [
                TextFormField(
                  cursorColor: const Color.fromRGBO(3, 37, 65, 1),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter film name!';
                    }

                    return null;
                  },
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintMaxLines: 2,
                    label: const Text(
                      'Search movie...',
                      style: TextStyle(
                        color: Color.fromRGBO(3, 37, 65, 1),
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color.fromRGBO(3, 37, 65, 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(3, 37, 65, 1),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: 60,
                    width: 75,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(3, 37, 65, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context
                              .read<SearchResultBloc>()
                              .add(SearchResultLoadedEvent(
                                title: textEditingController.text.toLowerCase(),
                              ));
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SearchResultScreen(),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Search',
                        style: AppTextStyles.whiteText15,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
