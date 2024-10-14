import 'package:breeds/app/core/theme/app_theme.dart';
import 'package:breeds/app/fetures/detail_feature/presentation/detail_screen.dart';
import 'package:breeds/app/fetures/home_feature/domain/enities/catbreed_entity.dart';
import 'package:breeds/app/fetures/home_feature/domain/repository/catbreeds_repository.dart';
import 'package:breeds/app/fetures/home_feature/presentation/bloc/home/home_bloc.dart';
import 'package:breeds/app/fetures/home_feature/presentation/home_screen.dart';
import 'package:breeds/app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  const baseUrl = "https://api.thecatapi.com";
  const token =
      "live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr";
  setUpInyection(baseUrl: baseUrl, token: token);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        catbreedsRepository: GetIt.instance<CatbreedsRepository>(),
      )..add(GetAllEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.ligth(),
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/detail':
        // Obtener la entidad que fue enviada como argumento
        final catBreedEntity = settings.arguments as CatBreedEntity;

        return MaterialPageRoute(
          builder: (context) {
            return DetailScreen(
                catBreedEntity: catBreedEntity); // Enviar la entidad
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const HomeScreen(), // Pantalla principal por defecto
        );
    }
  }
}
