import 'ChatContent.dart';

class ChatGenerator {
  static var chat = [
    ChatContent("Dart is beautiful\u{1F493}", "Deven", "1:20"),
    ChatContent("Petli get my earphones", "Aabu", "12:55"),
    ChatContent("You are the world's best friend \u{1F493}", "Duck", "12:45"),
    ChatContent("Kuhuhuhuhu\u{1F92D}", "Teesta", "12:35"),
    ChatContent("Tinnu Baby \u{1F636}", "Rai Chan", "12:20"),
    ChatContent("Good night \u{1F49C}", "Mrinal", "12:20"),
  ];

  static int chatCount = chat.length;
  static ChatContent getChatContent(int position) {
    return chat[position];
  }
}
