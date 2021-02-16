import 'package:carousel_app/constants/question_bank.dart';
import 'package:carousel_app/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_app/constants/constants.dart';

QuestionBank questionBank = QuestionBank();

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    @required this.current,
    @required this.index,
  });

  final int current;
  final int index;

  String getSelectedQuestionImage() {
    var _questionBank = questionBank.bank;

    String questionImage = '';

    for (Question q in _questionBank) {
      if (q.questionIndex == index) {
        questionImage = q.questionImage;
      }
    }

    return questionImage;
  }

  String getSelectedQuestionText() {
    var _questionBank = questionBank.bank;

    String questionText = '';

    for (Question q in _questionBank) {
      if (q.questionIndex == index) {
        questionText = q.question;
      }
    }

    return questionText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      margin: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 0.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/${getSelectedQuestionImage()}.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        child: GestureDetector(
          onTap: () {
            print('tapped');
          },
          child: Stack(
            alignment: Alignment(1, -1.1),
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 10.0, left: 20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      kTransparent,
                      kTransparent,
                      kTransparent,
                      kTransparent,
                      Colors.black.withOpacity(0.2)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.bottomLeft,
                child: Text(
                  getSelectedQuestionText(),
                  style: kCarouselTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
