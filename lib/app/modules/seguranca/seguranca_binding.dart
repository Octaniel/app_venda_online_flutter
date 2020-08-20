import 'package:Venda_Online_Ui/app/data/provider/seguranca.dart';
import 'package:Venda_Online_Ui/app/data/repository/seguranca_repository.dart';
import 'package:Venda_Online_Ui/app/modules/seguranca/seguranca_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SegurancaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SegurancaController>(() {
      return SegurancaController(
          SegurancaRepository(apiClient: Seguranca(httpClient: http.Client())));
    });
  }
}