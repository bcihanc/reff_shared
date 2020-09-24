import 'package:reff_shared/core/models/models.dart';

mixin Mocks {
  static final _initialDay = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 8);

  static final _yesterday =
      _initialDay.subtract(Duration(days: 1)).millisecondsSinceEpoch;
  static final _now = _initialDay.millisecondsSinceEpoch;
  static final _tomorrow =
      _initialDay.add(Duration(days: 1)).millisecondsSinceEpoch;

  static final user = users.first;

  static final question = questions.first;

  static final vote = votes.first;

  static final answer = answers.first;

  static final city = cities.first;

  static final users = [
    UserModel(
        id: "1",
        point: 10,
        age: 27,
        gender: Gender.OTHERS,
        education: Education.BACHELOR,
        city: CityModel(
            countryCode: "tr",
            langCode: "tr",
            utc: 3,
            name: "İstanbul",
            countryName: 'Turkey'),
        createdDate: _initialDay.millisecondsSinceEpoch),
    UserModel(
        id: "2",
        point: 10,
        age: 27,
        gender: Gender.MALE,
        education: Education.MASTER,
        city: CityModel(
            countryCode: "tr",
            langCode: "tr",
            utc: 3,
            name: "Antalya",
            countryName: 'Turkey'),
        createdDate: _initialDay.millisecondsSinceEpoch)
  ];

  static final questions = [
    QuestionModel(
        id: "1",
        header: "header",
        content: "content",
        startDate: _yesterday,
        endDate: _tomorrow,
        isActive: true,
        answers: ["1", "2"],
        city: CityModel(
            countryCode: "tr",
            langCode: "tr",
            name: "İstanbul",
            utc: 3,
            countryName: 'Turkey'),
        imageUrl: "imageurl.com"),
    QuestionModel(
        id: "2",
        header: "header",
        content: "content",
        startDate: _now,
        endDate: _tomorrow,
        isActive: false,
        answers: ["3", "4"],
        city: CityModel(
            countryCode: "tr",
            langCode: "tr",
            name: "İstanbul",
            utc: 3,
            countryName: 'Turkey'),
        imageUrl: "imageurl.com"),
  ];

  /*
  1. oy 1. kullanıcıya ait.
  1. soruya 1. aynıtı vermiş
  ---
  2. oy 2. kullanıcıya ait.
  1. soruya 2. yanıtı vermiş.
  ---
  3. oy 2. kullanıcıya ait.
  2. soruya 1.(id: "3") yanıtı vermiş
   */
  static final votes = [
    VoteModel(
      id: "1",
      userID: "1",
      questionID: "1",
      answerID: "1",
      city: CityModel.cities.first,
      age: 18,
      gender: Gender.MALE,
      education: Education.BACHELOR,
      createdDate: _initialDay.millisecondsSinceEpoch,
    ),
    VoteModel(
      id: "2",
      userID: "2",
      questionID: "1",
      answerID: "2",
      city: CityModel.cities.first,
      age: 18,
      gender: Gender.MALE,
      createdDate: _initialDay.millisecondsSinceEpoch,
      education: Education.BACHELOR,
    ),
    VoteModel(
      id: "3",
      userID: "2",
      questionID: "2",
      answerID: "3",
      city: CityModel.cities.first,
      age: 18,
      gender: Gender.MALE,
      education: Education.BACHELOR,
      createdDate: _initialDay.millisecondsSinceEpoch,
    ),
  ];

  static final answers = [
    AnswerModel(
        id: "1",
        content: "content1",
        imageUrl: "imageUrl1",
        color: MyColor.AMBER),
    AnswerModel(
        id: "2",
        content: "content2",
        imageUrl: "imageUrl2",
        color: MyColor.YELLOW),
    AnswerModel(
        id: "3",
        content: "content3",
        imageUrl: "imageUrl3",
        color: MyColor.RED),
    AnswerModel(
        id: "4",
        content: "content4",
        imageUrl: "imageUrl4",
        color: MyColor.GREY),
  ];

  static final cities = [
    CityModel(
      countryCode: "tr",
      name: "İstanbul",
      langCode: "tr",
      utc: 3,
      countryName: 'Turkey',
    ),
    CityModel(
      countryCode: "tr",
      name: "Antalya",
      langCode: "tr",
      utc: 3,
      countryName: 'Turkey',
    )
  ];
}
