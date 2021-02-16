import 'package:carousel_app/constants/constants.dart';
import 'package:carousel_app/models/question_model.dart';

class QuestionBank {
  List<Question> bank = [
    Question(
      questionTxt: '¿Consume cigarillo?',
      index: 0,
      image: 'test',
      groupNameEnum: GroupName.habitos,
    ),
    Question(
      questionTxt: '¿Consume licor?',
      index: 1,
      image: 'test1',
      groupNameEnum: GroupName.habitos,
    ),
    Question(
      questionTxt: '¿Ha consumido drogas (Sustancias Psicoactivas)?',
      index: 2,
      image: 'test2',
      groupNameEnum: GroupName.habitos,
    ),
  ];
}
