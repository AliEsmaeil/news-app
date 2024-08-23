import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = NewsAppCubit.getCubit(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
            titleTextStyle: Theme.of(context).textTheme.titleLarge,
          ),
          body: Column(
            children: [

              SizedBox(
                width: double.infinity,
                height: 100,
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  color: Theme.of(context).brightness == Brightness.light ?  Colors.white: Colors.black ,
                  surfaceTintColor:  Theme.of(context).brightness == Brightness.light ?  Colors.white: Colors.black ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Theme Mode',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Transform.scale(
                        scale: .7,
                        child: Switch(
                          activeColor: Colors.orange,
                          activeTrackColor: Colors.orange,
                          thumbColor: MaterialStateProperty.all(Colors.deepOrange),
                          trackOutlineColor:MaterialStateProperty.all(Colors.orange) ,
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.grey.shade200,
                          value: NewsAppCubit.isLightMode,
                          onChanged: (v){
                            cubit.changeThemeMode();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        );
        },

    );
  }
}
