import 'package:reff_shared/core/models/models.dart';

mixin Mocks {
  static final _initialDay = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 8);

  static final _yesterday =
      _initialDay.subtract(Duration(days: 1)).millisecondsSinceEpoch;
  static final _now = _initialDay.millisecondsSinceEpoch;
  static final _tomorrow =
      _initialDay.add(Duration(days: 1)).millisecondsSinceEpoch;

  static final userModel = usersModel.first;
  static final userJson = usersJson.first;

  static final questionModel = questionsModel.first;
  static final questionJson = questionsJson.first;

  static final voteModel = votesModel.first;
  static final voteJson = votesJson.first;

  static final answerModel = answersModel.first;
  static final answerJson = answersJson.first;

  static final cityModel = citiesModel.first;
  static final cityJson = citiesJson.first;

  static final usersModel = [
    UserModel(
        id: "1",
        point: 10,
        age: 27,
        gender: Gender.others,
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
        gender: Gender.male,
        city: CityModel(
            countryCode: "tr",
            langCode: "tr",
            utc: 3,
            name: "Antalya",
            countryName: 'Turkey'),
        createdDate: _initialDay.millisecondsSinceEpoch)
  ];

  static final usersJson = [
    {
      "id": "1",
      "age": 27,
      "gender": "OTHERS",
      "city": {
        "countryCode": "tr",
        'countryName': 'Turkey',
        "langCode": "tr",
        "name": "İstanbul",
        "utc": 3
      },
      "point": 10,
      "createdDate": _initialDay.millisecondsSinceEpoch
    },
    {
      "id": "2",
      "age": 27,
      "gender": "MALE",
      "city": {
        "countryCode": "tr",
        'countryName': 'Turkey',
        "langCode": "tr",
        "name": "Antalya",
        "utc": 3
      },
      "point": 10,
      "createdDate": _initialDay.millisecondsSinceEpoch
    }
  ];

  static final questionsModel = [
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

  static final questionsJson = [
    {
      "id": "1",
      "header": "header",
      "content": "content",
      "startDate": _yesterday,
      "endDate": _tomorrow,
      "isActive": true,
      "answers": ["1", "2"],
      "city": {
        "countryCode": "tr",
        'countryName': 'Turkey',
        "langCode": "tr",
        "name": "İstanbul",
        "utc": 3
      },
      "imageUrl": "imageurl.com",
      'likes': 0,
      'dislikes': 0
    },
    {
      "id": "2",
      "header": "header",
      "content": "content",
      "startDate": _now,
      "endDate": _tomorrow,
      "isActive": false,
      "answers": ["3", "4"],
      "city": {
        "countryCode": "tr",
        "langCode": "tr",
        "name": "İstanbul",
        'countryName': 'Turkey',
        "utc": 3
      },
      "imageUrl": "imageurl.com",
      'likes': 0,
      'dislikes': 0
    },
  ];

  static final votesModel = [
    VoteModel(
      id: "1",
      userID: "1",
      questionID: "1",
      answerID: "1",
      city: CityModel.cities.first,
      age: 18,
      gender: Gender.male,
      createdDate: _initialDay.millisecondsSinceEpoch,
    ),
    VoteModel(
      id: "2",
      userID: "2",
      questionID: "1",
      answerID: "2",
      city: CityModel.cities.first,
      age: 18,
      gender: Gender.male,
      createdDate: _initialDay.millisecondsSinceEpoch,
    ),
    VoteModel(
      id: "3",
      userID: "2",
      questionID: "2",
      answerID: "3",
      city: CityModel.cities.first,
      age: 18,
      gender: Gender.male,
      createdDate: _initialDay.millisecondsSinceEpoch,
    ),
  ];
  static final votesJson = [
    {
      "userID": "1",
      "questionID": "1",
      "answerID": "1",
      "id": "1",
      "createdDate": _initialDay.millisecondsSinceEpoch,
      'city': CityModel.cities.first.toJson(),
      'age': 18,
      'gender': 'MALE',
    },
    {
      "userID": "2",
      "questionID": "2",
      "answerID": "3",
      "id": "2",
      'city': CityModel.cities.first.toJson(),
      'age': 18,
      'gender': 'MALE',
      "timeStamp": _initialDay.millisecondsSinceEpoch,
    }
  ];

  static final answersModel = [
    AnswerModel(
        id: "1",
        content: "content",
        imageUrl: "imageUrl",
        color: MyColor.amber),
    AnswerModel(
        id: "2",
        content: "content",
        imageUrl: "imageUrl",
        color: MyColor.amber),
    AnswerModel(
        id: "3",
        content: "content",
        imageUrl: "imageUrl",
        color: MyColor.amber),
    AnswerModel(
        id: "4",
        content: "content",
        imageUrl: "imageUrl",
        color: MyColor.amber),
  ];
  static final answersJson = [
    {"id": "1", "content": "content", "imageUrl": "imageUrl", "color": "AMBER"},
    {"id": "2", "content": "content", "imageUrl": "imageUrl", "color": "AMBER"},
    {"id": "3", "content": "content", "imageUrl": "imageUrl", "color": "AMBER"},
    {"id": "4", "content": "content", "imageUrl": "imageUrl", "color": "AMBER"}
  ];

  static final citiesModel = [
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

  static final citiesJson = [
    {"countryCode": "tr", "name": "İstanbul", "langCode": "tr", "utc": 3},
    {"countryCode": "tr", "name": "Antalya", "langCode": "tr", "utc": 3},
  ];
}
