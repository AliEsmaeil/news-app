import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/news_item_builder.dart';

Widget buildListView({required List list ,required BuildContext context}){

  print(list.length);
  return ConditionalBuilder(
    condition: list.isNotEmpty,
    fallback:(context)=> const Center(child: CircularProgressIndicator(color: Colors.orange,),),
    builder: (context)=>ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context,index){
        //if(list[index]['title'] != null && list[index]['urlToImage']!=null){
          //if(list[index]['title'] != ['Removed'] && list[index]['urlToImage'].contains('.')){
          return NewsItemBuilder(item: list[index]);
        //}
      //}
          // return  const SizedBox.shrink();

        }
      ,
      separatorBuilder: (context,index){
        if(list[index]['title'] != null && list[index]['urlToImage']!=null){
          if(list[index]['title'] != ['Removed'] && list[index]['urlToImage'].contains('.')){
            return const Divider();
          }
        }
        return const SizedBox.shrink();
      }
    ),
  );

}