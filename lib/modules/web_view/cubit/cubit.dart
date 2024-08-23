import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/web_view/cubit/states.dart';

class WebViewCubit extends Cubit<WebViewStates>{

  int loadingPercentage = 0;

  WebViewCubit():super(WebViewInitialState());

  static WebViewCubit  getCubit(BuildContext context)=>BlocProvider.of(context);


    void changeLoadingPercentage(int v){

      emit(WebViewBeginState());

      loadingPercentage = v;
      if(loadingPercentage == 100)
        {
          emit(WebViewEndState());
        }
      else
      {
        emit(WebViewUpdateState());
      }
  }
}