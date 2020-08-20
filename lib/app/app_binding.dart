import 'package:get/get.dart';
import 'app_controller.dart';
import 'data/model/usuario.dart';
import 'data/provider/produto.dart';
import 'data/repository/produto_repository.dart';
import 'modules/produto/produto_controller.dart';
import 'package:http/http.dart' as http;

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(AppController());
    Get.put<Usuario>(Usuario());
    Get.put<ProdutoController>(ProdutoController(
        repository:
        ProdutoRepository(apiClient: Produto(httpClient: http.Client())))
    );
  }
}
