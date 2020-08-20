import 'package:Venda_Online_Ui/app/modules/home/home_binding.dart';
import 'package:Venda_Online_Ui/app/modules/home/pages/home_page.dart';
import 'package:Venda_Online_Ui/app/modules/produto/pages/carrinho_page.dart';
import 'package:Venda_Online_Ui/app/modules/produto/pages/info_produto_page.dart';
import 'package:Venda_Online_Ui/app/modules/produto/pages/lista_produto_page.dart';
import 'package:Venda_Online_Ui/app/modules/produto/produto_binding.dart';
import 'package:Venda_Online_Ui/app/modules/seguranca/page/cadastro_page.dart';
import 'package:Venda_Online_Ui/app/modules/seguranca/page/login_page.dart';
import 'package:Venda_Online_Ui/app/modules/seguranca/seguranca_binding.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.PRODUTO, page: () => ListaProdutoPage(), binding: ProdutoBinding()),
    GetPage(name: Routes.CARRINHO, page: () => CarrinhoPage(), binding: ProdutoBinding()),
    GetPage(name: Routes.PINFO, page: () => InfoProdutoPage(), binding: ProdutoBinding()),
    GetPage(name: Routes.SEGURANCA, page: () => LoginPage(), binding: SegurancaBinding()),
    GetPage(name: Routes.SREGISTRAR, page: () => CadastroPage(), binding: SegurancaBinding()),
  ];
}
