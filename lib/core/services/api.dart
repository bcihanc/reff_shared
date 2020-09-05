import 'package:reff_shared/core/services/answer_api.dart';
import 'package:reff_shared/core/services/question_api.dart';
import 'package:reff_shared/core/services/user_api.dart';
import 'package:reff_shared/core/services/vote_api.dart';

abstract class BaseApi {
  final BaseQuestionApi question;
  final BaseAnswerApi answer;
  final BaseUserApi user;
  final BaseVoteApi vote;

  BaseApi({
    this.question,
    this.answer,
    this.user,
    this.vote,
  });
}
