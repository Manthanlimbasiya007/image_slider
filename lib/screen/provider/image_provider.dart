import 'package:flutter/material.dart';

class PhotoProvider extends ChangeNotifier
{
   List SliderImageList = [
     "assets/images/mahadev5.jpg",
     "assets/images/mahadev4.jpg",
     "assets/images/mahadev20.jpg",
     "assets/images/mahadev11.jpg",
     "assets/images/mahadev9.jpg",
   ];
   int currrentImageIndex =0;

   void ChangeIndex(int index)
   {
     currrentImageIndex = index;
     notifyListeners();
   }
}