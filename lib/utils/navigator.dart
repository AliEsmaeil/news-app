import 'package:flutter/material.dart';

void navigateTo(Widget widget , BuildContext context)=>Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context)=>widget,
  ),
);