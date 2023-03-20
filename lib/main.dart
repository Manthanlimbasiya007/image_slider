import 'package:flutter/material.dart';
import 'package:image_slider/screen/provider/image_provider.dart';
import 'package:image_slider/screen/view/image_slider.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PhotoProvider(),),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => imageslider(),
      },
    ),
  ));
}