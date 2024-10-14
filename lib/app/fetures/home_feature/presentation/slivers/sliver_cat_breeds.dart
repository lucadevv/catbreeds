import 'package:breeds/app/core/constans/app_colors.dart';
import 'package:breeds/app/core/extensions/size_extension.dart';
import 'package:breeds/app/fetures/home_feature/presentation/bloc/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverCatbreeds extends StatefulWidget {
  const SliverCatbreeds({
    super.key,
  });

  @override
  State<SliverCatbreeds> createState() => _SliverCatbreedsState();
}

class _SliverCatbreedsState extends State<SliverCatbreeds> {
  bool myAnimation = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        myAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.filteredList.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text("No hay datos que mostrar :("),
            ),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final breed = state.filteredList[index];

              return AnimatedContainer(
                duration: Duration(milliseconds: 300 + (index * 100)),
                curve: Curves.easeInOut,
                transform: Matrix4.translationValues(
                  myAnimation ? 0 : -300,
                  0,
                  0,
                ),
                child: Container(
                  height: 300,
                  margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(
                    bottom: 16,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.secondary.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            breed.name,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/detail',
                                arguments: breed,
                              );
                            },
                            child: const Text(
                              "Más...",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      12.00.hSpace,
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: breed,
                            );
                          },
                          child: Hero(
                            tag: breed.name,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      breed.imageUrl ?? imagePlaceholder),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      12.00.hSpace,
                      Row(
                        children: [
                          Text(
                            breed.origin,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Inteligencia: ${breed.intelligence}",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: state
                .filteredList.length, // Usamos la longitud de la lista filtrada
          ),
        );
      },
    );
  }
}

const imagePlaceholder =
    "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg";
