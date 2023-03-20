import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_slider/screen/provider/image_provider.dart';
import 'package:provider/provider.dart';

class imageslider extends StatefulWidget {
  const imageslider({Key? key}) : super(key: key);

  @override
  State<imageslider> createState() => _imagesliderState();
}

class _imagesliderState extends State<imageslider> {
  PhotoProvider? photoProviderTrue;
  PhotoProvider? photoProviderFalse;

  @override
  Widget build(BuildContext context) {
    photoProviderTrue = Provider.of<PhotoProvider>(context, listen: true);
    photoProviderFalse = Provider.of<PhotoProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Image Slider"),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: 5,
                itemBuilder: (context, index, realIndex) {
                  return Image.asset(
                      photoProviderFalse!.SliderImageList[index]);
                },
                options: CarouselOptions(
                  height: 400,
                  autoPlay: true,
                  aspectRatio: 1,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  initialPage: 0,
                  autoPlayCurve: Curves.easeInQuart,
                  autoPlayInterval: Duration(seconds: 2),
                  onPageChanged: (index, reason) {
                    print(index);
                   photoProviderTrue!.ChangeIndex(index);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: photoProviderTrue!.SliderImageList
                    .asMap()
                    .entries
                    .map((e) => Container(
                          height: 10,
                          width: 10,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color:
                                e.key == photoProviderTrue!.currrentImageIndex
                                    ? Colors.black
                                    : Colors.black45,
                            shape: BoxShape.circle,
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
