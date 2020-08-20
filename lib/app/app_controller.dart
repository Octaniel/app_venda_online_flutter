import 'package:get/get.dart';

class AppController extends GetxController {
  AppController();

  var _url = "/home".obs;

  String get url => _url.value;

  set url(String value) {
    _url.value = value;
  }
  @override
  void onClose() {
    print("object");
    super.onClose();
  }
}
