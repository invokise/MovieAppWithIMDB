import 'package:filmoteka/services/cache_service.dart';
import 'package:filmoteka/ui/full_overview_movie_screen/bloc/full_overview_movie_bloc.dart';
import 'package:filmoteka/ui/main_screen.dart';
import 'package:filmoteka/ui/search_result_screen/bloc/search_result_bloc.dart';
import 'package:filmoteka/ui/search_result_screen/search_result_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'ui/authentification_screen/authentification_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  await CacheService.initPreference();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchResultBloc>(
          create: (BuildContext context) => SearchResultBloc(),
        ),
        BlocProvider<FullOverviewMovieBloc>(
          create: (BuildContext context) => FullOverviewMovieBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Provider(
                      create: (context) => FirebaseAuth.instance.currentUser,
                      child: const MainScreen());
                } else {
                  return const AuthentificationScreen();
                }
              }),
          '/second': (context) => const SearchResultScreen(),
        },
      ),
    );
  }
}
