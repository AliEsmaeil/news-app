import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/list_view_builder.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsAppCubit, NewsAppStates>(

      builder: (context, state) {
        var list = NewsAppCubit.scienceList;
        return buildListView(list: list, context: context);
      },
    );
  }
}
