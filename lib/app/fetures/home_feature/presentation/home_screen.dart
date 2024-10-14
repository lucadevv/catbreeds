import 'package:breeds/app/core/constans/app_colors.dart';
import 'package:breeds/app/core/constans/app_text.dart';
import 'package:breeds/app/fetures/home_feature/presentation/bloc/home/home_bloc.dart';
import 'package:breeds/app/fetures/home_feature/presentation/delegates/search_delegate.dart';
import 'package:breeds/app/fetures/home_feature/presentation/slivers/sliver_cat_breeds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              backgroundColor: AppColors.tertary,
              leading: Icon(Iconsax.menu),
              title: Text(AppText.appBarTitle),
              centerTitle: true,
            ),
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12),
              sliver: SliverPersistentHeader(
                pinned: true,
                delegate: SearchSliverPersistentHeaderDelegate(
                  minHeight: 70,
                  maxHeight: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        context.read<HomeBloc>().add(SearchBreedsEvent(value));
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.search_normal_1),
                        suffixIcon: IconButton(
                          icon: const Icon(Iconsax.close_circle),
                          onPressed: () {
                            _searchController.clear();
                            context
                                .read<HomeBloc>()
                                .add(const SearchBreedsEvent(''));
                          },
                        ),
                        labelText: AppText.search,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                switch (state.homeStatus) {
                  case HomeStatus.loading:
                    return const SliverFillRemaining(
                      hasScrollBody:
                          false, // Evita que el contenido sea desplazable
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.secondary,
                        ),
                      ),
                    );
                  case HomeStatus.success:
                    if (state.filteredList.isEmpty) {
                      return const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            "No hay existe esa raza de gato 😁",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                    return const SliverCatbreeds();
                  default:
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Text(
                          "Estamos trabajando para mejorar la experencia",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
