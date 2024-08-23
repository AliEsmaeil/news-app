import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/body/business.dart';
import 'package:news_app/modules/body/entertainment.dart';
import 'package:news_app/modules/body/science.dart';
import 'package:news_app/modules/body/search_result.dart';
import 'package:news_app/modules/body/sports.dart';
import 'package:news_app/modules/settings.dart';
import 'package:news_app/utils/navigator.dart';
import 'package:news_app/utils/text_form_field/default_form_field.dart';
import 'package:news_app/utils/text_form_field/text+form_handler.dart';

class NewsAppLayout extends StatelessWidget {
  final body = const [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
    EntertainmentScreen(),
    SearchResultScreen(),
  ];

  String textInitialValue = '';

  NewsAppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsAppCubit, NewsAppStates>(

        builder: (context, state) {
          var cubit = NewsAppCubit.getCubit(context);
          return Scaffold(
            body: SafeArea(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      title: Text(
                        'Recent News',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      floating: true,
                      //pinned: true,
                      forceElevated: innerBoxIsScrolled,
                      actions: [
                        IconButton(
                          icon: FaIcon(NewsAppCubit.isLightMode
                              ? Icons.dark_mode
                              : Icons.light_mode),
                          onPressed: () {
                            cubit.changeThemeMode();
                          },
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.gear),
                          onPressed: () {
                            navigateTo(const SettingsScreen(), context);
                          },
                        ),
                      ],
                      bottom: PreferredSize(
                        preferredSize: const Size(double.infinity, 60),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: defaultTextFormField(
                                       context: context,
                                       initialValue: textInitialValue,
                                       label: 'Search',
                                       validator: const TextFormStatusHandler()
                                           .getValidatorFunction(
                                           errorMessage: 'Enter a Word!'),
                                       onTap: () {
                                         cubit.resetCurrentIndex();
                                       },
                                       onChange: (v) {
                                         textInitialValue = v!;
                                         cubit.searchWord(v);
                                       },
                                       preIcon: Icons.search
                                   ),
                        ),
                      ),
                    ),
                  ];
                },
                body: state is SearchCompleteState ? body[4] : body[NewsAppCubit.currentIndex== -1 ? NewsAppCubit.previousIndex : NewsAppCubit.currentIndex],
              ),
            ),
            bottomNavigationBar: NavigationBar(
              selectedIndex: NewsAppCubit.currentIndex ==-1 ? 0 : NewsAppCubit.currentIndex,
              onDestinationSelected: (index) {
                cubit.changeNavigationDestination(index);
              },
              destinations: const [
                NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.businessTime),
                  label: 'Business',
                ),
                NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.flask),
                  label: 'Science',
                ),
                NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.futbol),
                  label: 'Sports',
                ),
                NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.film),
                  label: 'Entertainment',
                ),
              ],
            ),
          );
        });
  }
}
