import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reff_shared/core/models/QuestionModel.dart';
import 'package:reff_shared/core/models/models.dart';
import 'package:reff_shared/core/services/services.dart';
import 'package:reff_shared/core/utils/constants.dart';
import 'package:reff_shared/core/utils/mocks.dart';

void main() async {
  final testInstance = MockFirestoreInstance();
  final userApi = UserFirebaseApi(instance: testInstance);
  final voteApi = VoteFirebaseApi(instance: testInstance);
  final questionApi = QuestionFirestoreApi(instance: testInstance);

  group("user firestore api tests", () {
    // tümt testler önce instance temizliği
    setUp(() async => await testInstance.clearPersistence());

    test("get", () async {
      await testInstance
          .collection(CollectionNames.collectionNameUsers)
          .doc(Mocks.user.id)
          .set(Mocks.user.toJson());

      final user = await userApi.get(Mocks.user.id);
      expect(user, Mocks.user);

      final notFound = await userApi.get("any");
      expect(notFound, null);
    });

    test("add", () async {
      final user = Mocks.user;
      final id = await userApi.add(user);
      final userWithID = user.copyWith.call(id: id);

      final doc = await testInstance
          .collection(CollectionNames.collectionNameUsers)
          .doc(id);

      final reference = await doc.get();
      final json = reference.data();
      expect(userWithID, UserModel.fromJson(json));
    });

    test("isVotedThisQuestion", () async {
      // önce kullanıcıları ekleyelim
      await Future.forEach<UserModel>(Mocks.users, (user) async {
        await testInstance
            .collection(CollectionNames.collectionNameUsers)
            .doc(user.id)
            .set(user.toJson());
      });

      // sonra oyları
      await Future.forEach<VoteModel>(Mocks.votes, (vote) async {
        await testInstance
            .collection(CollectionNames.collectionNameVotes)
            .doc(vote.id)
            .set(vote.toJson());
      });

      // ve sorular
      await Future.forEach<QuestionModel>(Mocks.questions, (question) async {
        await testInstance
            .collection(CollectionNames.collectionNameQuestions)
            .doc(question.id)
            .set(question.toJson());
      });

      // 1. kullanıcı 1. soruya oy kullandı, true
      final result = await userApi.isVotedThisQuestion(
          Mocks.users[0].id, Mocks.questions[0].id);
      expect(result, true);

      //1. kullanıcı 2. soruya oy kullanmadı, false
      final result2 = await userApi.isVotedThisQuestion(
          Mocks.users[0].id, Mocks.questions[1].id);
      expect(result2, false);

      //2. kullanıcı 1. soruya oy kullandı, true
      final result3 = await userApi.isVotedThisQuestion(
          Mocks.users[1].id, Mocks.questions[0].id);
      expect(result3, true);

      //2. kullanıcı 2. soruya oy kullandı, true
      final result4 = await userApi.isVotedThisQuestion(
          Mocks.users[1].id, Mocks.questions[1].id);
      expect(result4, true);
    });

    test("remove", () async {
      // kullanıcıyı ekleyelim
      await testInstance
          .collection(CollectionNames.collectionNameUsers)
          .doc(Mocks.user.id)
          .set(Mocks.user.toJson());

      // sonra kullanıcının oylarını
      await testInstance
          .collection(CollectionNames.collectionNameVotes)
          .doc(Mocks.vote.id)
          .set(Mocks.vote.toJson());

      final result = await userApi.remove(Mocks.user.id);
      expect(result, true);
    });
  });

  group("vote firestore api tests", () {
    // tümt testler önce instance temizliği
    setUp(() async => await testInstance.clearPersistence());

    test("getsByQuestion", () async {
      await Future.forEach<VoteModel>(Mocks.votes, (vote) async {
        await testInstance
            .collection(CollectionNames.collectionNameVotes)
            .doc(vote.id)
            .set(vote.toJson());
      });

      await Future.forEach<QuestionModel>(Mocks.questions, (question) async {
        await testInstance
            .collection(CollectionNames.collectionNameQuestions)
            .doc(question.id)
            .set(question.toJson());
      });

      // 1. soruyla ilgili 2 oy var
      final votes1 = await voteApi.getsByQuestion(Mocks.questions[0].id);
      expect(votes1.length, 2);

      // 2. soruyla ilgili 1 oy var
      final votes2 = await voteApi.getsByQuestion(Mocks.questions[1].id);
      expect(votes2.length, 1);
    });
  });

  group("question firestore api test", () {
    // tümt testler önce instance temizliği
    setUp(() async => await testInstance.clearPersistence());

    test("get", () async {
      // yeni bir soru
      await testInstance
          .collection(CollectionNames.collectionNameQuestions)
          .doc(Mocks.question.id)
          .set(Mocks.question.toJson());

      final question = await questionApi.get(Mocks.question.id);
      expect(question, Mocks.question);
    });

    test("add", () async {
      final id = await questionApi.add(Mocks.question);
      final withID = Mocks.question.copyWith.call(id: id);
      final doc = await testInstance
          .collection(CollectionNames.collectionNameQuestions)
          .doc(id)
          .get();

      final fromJson = QuestionModel.fromJson(doc.data());
      expect(withID, fromJson);
    });

    test("update", () async {
      // yeni bir soru
      await testInstance
          .collection(CollectionNames.collectionNameQuestions)
          .doc(Mocks.question.id)
          .set(Mocks.question.toJson());

      final updatedQuestion =
          Mocks.question.copyWith.call(content: "new content");

      final updateResult =
          await questionApi.update(Mocks.question.id, updatedQuestion);

      expect(updateResult, true);

      final doc = await testInstance
          .collection(CollectionNames.collectionNameQuestions)
          .doc(Mocks.question.id)
          .get();

      final updatedQuestionFromJson = QuestionModel.fromJson(doc.data());

      expect(updatedQuestion, updatedQuestionFromJson);
    });

    test("remove", () async {
      // yeni bir soru
      await testInstance
          .collection(CollectionNames.collectionNameQuestions)
          .doc(Mocks.question.id)
          .set(Mocks.question.toJson());

      final removeResult = await questionApi.remove(Mocks.question.id);

      expect(removeResult, true);

      final doc = await testInstance
          .collection(CollectionNames.collectionNameQuestions)
          .doc(Mocks.question.id)
          .get();

      expect(doc.exists, false);
    });

    test("gets : activeQuestion", () async {
      // aktif bir soru
      final activeQuestion = QuestionModel(
          isActive: true,
          header: "null",
          startDate: DateTime.now().millisecondsSinceEpoch,
          endDate: DateTime.now().add(Duration(days: 1)).millisecondsSinceEpoch,
          city: CityModel.cities.first);

      final passiveQuestion1 = QuestionModel(
          isActive: false,
          header: "null",
          startDate: DateTime.now().millisecondsSinceEpoch,
          endDate: DateTime.now().add(Duration(days: 1)).millisecondsSinceEpoch,
          city: CityModel.cities.first);
      final passiveQuestion2 = QuestionModel(
          isActive: false,
          header: "null",
          startDate: DateTime.now().millisecondsSinceEpoch,
          endDate: DateTime.now().add(Duration(days: 1)).millisecondsSinceEpoch,
          city: CityModel.cities.first);

      for (final question in [
        activeQuestion,
        passiveQuestion1,
        passiveQuestion2
      ]) {
        await testInstance
            .collection(CollectionNames.collectionNameQuestions)
            .doc(question.id)
            .set(question.toJson());
      }

      final activeQuestions =
          questionApi.getsSnapshots(onlyActiveQuestions: true);
      expectLater(activeQuestions, emits([activeQuestion]));

      final passiveQuestions =
          questionApi.getsSnapshots(onlyActiveQuestions: false);
      expectLater(
          passiveQuestions, emits([passiveQuestion1, passiveQuestion2]));
    });

    test("gets : dateTime", () async {
      int _purefiedMilisecond(DateTime dateTime) =>
          DateTime(dateTime.year, dateTime.month, dateTime.day)
              .millisecondsSinceEpoch;

      // dün başlayıp yarın bitecek bir soru
      final startYestardayEndTomorrow = QuestionModel(
          id: "1",
          isActive: true,
          header: "null",
          startDate:
              _purefiedMilisecond(DateTime.now().subtract(Duration(days: 1))),
          endDate: _purefiedMilisecond(DateTime.now().add(Duration(days: 1))),
          city: CityModel.cities.first);

      // dün bitmiş bir soru
      final endYesterday = QuestionModel(
          id: "2",
          isActive: true,
          header: "null",
          startDate:
              _purefiedMilisecond(DateTime.now().subtract(Duration(days: 2))),
          endDate:
              _purefiedMilisecond(DateTime.now().subtract(Duration(days: 1))),
          city: CityModel.cities.first);

      // yarın başlayacak bir soru
      final startTomorrow = QuestionModel(
          id: "3",
          isActive: true,
          header: "null",
          startDate: _purefiedMilisecond(DateTime.now().add(Duration(days: 1))),
          endDate: _purefiedMilisecond(DateTime.now().add(Duration(days: 3))),
          city: CityModel.cities.first);

      for (final question in [
        startYestardayEndTomorrow,
        endYesterday,
        startTomorrow
      ]) {
        await testInstance
            .collection(CollectionNames.collectionNameQuestions)
            .doc(question.id)
            .set(question.toJson());
      }

      final todaysQuestions = questionApi
          .getsSnapshots(afterDateTime: DateTime.now())
          .map((event) => event.dateTimeCorrection());

      expectLater(todaysQuestions, emits([startYestardayEndTomorrow]));

      final tomorrowQuestions = questionApi
          .getsSnapshots(
              afterDateTime: DateTime.now().subtract(Duration(days: 1)))
          .map((event) => event.dateTimeCorrection());
      expectLater(tomorrowQuestions, emits([startYestardayEndTomorrow]));

      final startTomorrowQuestions = questionApi.getsSnapshots(
          afterDateTime: DateTime.now().add(Duration(days: 1, hours: 1)));
      expectLater(startTomorrowQuestions, emits([startTomorrow]));
    });

    test("gets : city", () async {
      // 1. soru izmirden
      final izmirQuestion = QuestionModel(
          header: "null",
          startDate: DateTime.now().millisecondsSinceEpoch,
          endDate: DateTime.now().millisecondsSinceEpoch,
          city: CityModel.cities.singleWhere((city) => city.name == "İzmir"));

      // 1. soru istanbuldan
      final istanbulQuestion = QuestionModel(
          header: "null",
          startDate: DateTime.now().millisecondsSinceEpoch,
          endDate: DateTime.now().millisecondsSinceEpoch,
          city:
              CityModel.cities.singleWhere((city) => city.name == "İstanbul"));

      // ve 2 soru da genel türkiyeden
      final turkiyeQuestions = List.generate(
          2,
          (index) => QuestionModel(
              header: "null",
              startDate: DateTime.now().millisecondsSinceEpoch,
              endDate: DateTime.now().millisecondsSinceEpoch,
              city: CityModel.cities
                  .singleWhere((city) => city.name == "Turkey")));

      // soruları ekleyelim
      final questions = [izmirQuestion, istanbulQuestion, ...turkiyeQuestions];

      for (final question in questions) {
        await testInstance
            .collection(CollectionNames.collectionNameQuestions)
            .doc(question.id)
            .set(question.toJson());
      }

      final izmirCity =
          CityModel.cities.singleWhere((city) => city.name == "İzmir");

      final izmirQuestionStream = questionApi.getsSnapshots(city: izmirCity);

      expectLater(
          izmirQuestionStream, emits([izmirQuestion, ...turkiyeQuestions]));
    });
  });

  group("vote firestore test", () {
    // tümt testler önce instance temizliği
    setUp(() async => await testInstance.clearPersistence());
  });
}
