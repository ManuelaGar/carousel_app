import 'package:carousel_app/constants/constants.dart';

class Question {
  String question;
  int questionIndex;
  String questionImage;
  GroupName selectedGroup;

  Question({
    String questionTxt,
    int index,
    String image,
    GroupName groupNameEnum,
  }) {
    question = questionTxt;
    questionIndex = index;
    questionImage = image;
    selectedGroup = groupNameEnum;
  }
}
