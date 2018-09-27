import 'CallContent.dart';

class CallGenerator {
  static var call = [
    CallContent("Tanya", "Yesterday, 23:56"),
    CallContent("Abhiroop", "(2)24th September, 22:02"),
    CallContent("Ankit", "(2)23th September, 21:03"),
    CallContent("Baba", "22nd September, 00:00"),
    CallContent("Maa", "21st September, 9:00")
  ];

  static int totalCalls = call.length;

  static CallContent getCallDetails(int position) {
    return call[position];
  }
}
