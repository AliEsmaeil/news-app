import 'package:flutter/material.dart';
import 'package:news_app/layout/cubit/cubit.dart';

Widget defaultTextFormField({
  required BuildContext context,
  required String label,
  IconData? preIcon,
  required String initialValue,
  required String?Function(String?) validator,
  required Function(String?) onChange,
  required VoidCallback onTap,
})=> TextFormField(

  maxLines: 1,
  textInputAction: TextInputAction.go,
  keyboardType: TextInputType.text,
  initialValue: initialValue,
  validator: validator ,
  onChanged: onChange,
  onTap: onTap,
  style: Theme.of(context).textTheme.bodyMedium,
  keyboardAppearance: NewsAppCubit.isLightMode? Brightness.light: Brightness.dark,
  decoration: InputDecoration().copyWith(
    labelText: label,
    prefixIcon: Icon(preIcon,size: 17,),

  )
);