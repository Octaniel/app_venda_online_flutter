import 'package:Venda_Online_Ui/app/data/provider/home_provider.dart';
import 'package:Venda_Online_Ui/app/data/repository/home_repository.dart';
import 'package:Venda_Online_Ui/app/modules/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(
        repository: HomeRepository(
            apiClient: HomeApiClient(httpClient: http.Client()))));
  }
}
