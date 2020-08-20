import 'package:Venda_Online_Ui/app/data/provider/item_carrinho_provider.dart';
import 'package:Venda_Online_Ui/app/data/repository/item_carrinho_repository.dart';
import 'package:Venda_Online_Ui/app/modules/produto/item_carrinho_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProdutoBinding implements Bindings {
  @override
  void dependencies() {

    Get.put<ItemCarrinhoController>(
       ItemCarrinhoController(
          repository:
          ItemCarrinhoRepository(apiClient: ItemCarrinhoProvider(httpClient: http.Client())))
    );
  }
}
