import 'dart:io';
import 'package:carousel_app/components/carousel_card.dart';
import 'package:carousel_app/constants/question_bank.dart';
import 'package:carousel_app/models/question_model.dart';
import 'constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carousel Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CarouselScreen(),
    );
  }
}

QuestionBank questionBank = QuestionBank();

class CarouselScreen extends StatefulWidget {
  @override
  _CarouselScreenState createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget phoneScreenLayout(photos) {
    List<CarouselCard> cards = [];
    for (String q in photos) {
      int index = photos.indexOf(q);
      cards.add(CarouselCard(
        current: _current,
        index: index,
      ));
    }

    return Column(
      children: <Widget>[
        Container(
          margin:
              EdgeInsets.fromLTRB(0.0, Platform.isIOS ? 30.0 : 10.0, 0.0, 10.0),
          child: CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).copyWith().size.width,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(seconds: 2),
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: cards,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(photos, (index, url) {
            return Container(
              width: 7.0,
              height: 7.0,
              margin: Platform.isIOS
                  ? EdgeInsets.symmetric(vertical: 5.0, horizontal: 3)
                  : EdgeInsets.fromLTRB(3.0, 5.0, 3.0, 10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    _current == index ? kSelectedIconMenu : kUnselectedIconMenu,
              ),
            );
          }),
        ),
      ],
    );
  }

  List<String> getCarouselPhotos() {
    List<String> carouselPhotos = [];

    var _questionBank = questionBank.bank;

    for (Question q in _questionBank) {
      carouselPhotos.add(q.questionImage);
    }

    return carouselPhotos;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> photos = getCarouselPhotos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            phoneScreenLayout(photos),
          ],
        ),
      ),
    );
  }
}
