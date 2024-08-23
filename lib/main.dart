import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/news_categories/news_categories.dart';
import 'package:news_app/core/themes/dark_theme.dart';
import 'package:news_app/core/themes/light_theme.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/layout/news_app_layout.dart';
import 'package:news_app/modules/web_view/cubit/cubit.dart';
import 'package:news_app/network/local_storage/shared_preference.dart';
import 'package:news_app/utils/bloc_observer.dart';
import 'network/remote/dio_helper.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await SharedPreferenceHelper.init();
  DioHelper.initiateDio();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context)=>NewsAppCubit()..fillCategoryList(category: NewsCategories.business),
        ),
        BlocProvider(
          create: (context)=>WebViewCubit(),
        ),
      ],
      child: MaterialApp(
            home: NewsAppLayout(),
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: getLightTheme(),
            darkTheme: getDarkTheme(),
            themeMode: NewsAppCubit.isLightMode ? ThemeMode.light: ThemeMode.dark,
          )
    );
  }
}
