class LogMessages {
  static String created(String id) => "created with id: $id";
  static const notCreated = "cant created!";

  static String found(String id) => "found $id";
  static const notFound = "not found!";

  static String removed(String id) => "removed $id";
  static String notRemoved(String id) => "not removed $id";

  static String updated(String id) => "updated $id";
  static String notUpdated(String id) => "not updated $id";

  static const votedThisQuestion = "this question is voted";
  static const notVotedThisQuestion = "this question is not voted";
}
