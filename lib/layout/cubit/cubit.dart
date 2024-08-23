import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/news_categories/news_categories.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/network/local_storage/shared_preference.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsAppCubit extends Cubit<NewsAppStates>{

  static int currentIndex = -1 ; // when it's -1 means , the user is searching and he/she is not in a specific navigation
  static int previousIndex = 0;
  String apiKey = '6174672c178b45bf851530a827548a0f'; // another key :  e18b0998f2be47139c4130123b3c4c5b
  static bool isLightMode =  SharedPreferenceHelper().getThemeMode();
  static List<dynamic> businessList = [];
  static List<dynamic> scienceList = [];
  static List<dynamic> sportsList = [];
  static List<dynamic> entertainmentList = [];
  static List<dynamic> searchList = [];


  NewsAppCubit():super(NewsAppInitialState());

  static NewsAppCubit getCubit(context)=>BlocProvider.of(context);

  void resetCurrentIndex() {
    if(currentIndex != -1) {
      previousIndex = currentIndex;
    }
    currentIndex = -1;
    emit(ResetCurrentIndexState());
  }

  void changeNavigationDestination(int index){
    currentIndex = index;
    switch(index){
      case 1 : fillCategoryList(category: NewsCategories.science);
      case 2 : fillCategoryList(category: NewsCategories.sports);
      case 3 : fillCategoryList(category: NewsCategories.entertainment);
    }
    emit(NavigationBarState());
  }

  void changeThemeMode(){

    isLightMode = !isLightMode;

    SharedPreferenceHelper().setThemeMode(value: isLightMode)
        .then((value) =>emit(ThemeModeChangedState()));

  }

  void fillCategoryList({required NewsCategories category})async{

    switch(category){

      case NewsCategories.business:{
        if(businessList.isEmpty){
          emit(LoadingState());
          businessList = await getCategoryList('business');
          emit(GotDataState());
        }
      }

      case NewsCategories.science:{
        if(scienceList.isEmpty){
          emit(LoadingState());
          scienceList = await getCategoryList('science');
          emit(GotDataState());
        }
      }

      case NewsCategories.sports:{
        if(sportsList.isEmpty){
          emit(LoadingState());
          sportsList = await getCategoryList('sports');
          emit(GotDataState());
        }
      }

      case NewsCategories.entertainment:{
        if(entertainmentList.isEmpty){
          emit(LoadingState());
          entertainmentList = await getCategoryList('entertainment');
          emit(GotDataState());
        }
      }
    }
  }
  Future<List<dynamic>> getCategoryList(String category)async{

    return await DioHelper().getData(
        serverPath: 'v2/top-headlines',
        query: {
        'country' : 'us',
        'category' : category,
        'apiKey': apiKey,
        }).then((value) => value.data['articles'])
        .catchError((err){
    });

  }
  void searchWord(String key)async{

  //emit(LoadingState());
  await DioHelper().getData(
        serverPath: 'v2/everything',
        query: {

          'q': key,
          'apiKey': apiKey,
        }).then((value) => searchList = value.data['articles'])
        .catchError((err){
    });
  emit(SearchCompleteState());



  }
}