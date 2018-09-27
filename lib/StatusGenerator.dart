import 'StatusContent.dart';

class StatusGenerator {
  static var status = [
    StatusContent("Nan didi", "38 minutes ago"),
    StatusContent("Duck", "Today, 13:51"),
    StatusContent("Pancham", "Today, 10:03"),
    StatusContent("Bhaluk", "Yesterday, 21:50"),
    StatusContent("Ujwal", "Yesterday, 20:02")
  ];

  static int statusCount = status.length;
  static StatusContent getStatusContent(int position) {
    return status[position];
  }
}
