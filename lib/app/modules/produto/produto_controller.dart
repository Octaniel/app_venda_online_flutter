import 'package:Venda_Online_Ui/app/data/model/produto_dto.dart';
import 'package:Venda_Online_Ui/app/data/model/tamanho.dart';
import 'package:Venda_Online_Ui/app/data/repository/produto_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class ProdutoController extends GetxController {
  final ProdutoRepository repository;

  ProdutoController({@required this.repository}) : assert(repository != null);

  var _prd = List<ProdutoDto>().obs;
  var _search = ''.obs;
  var _id = 0.obs;
  var _selectedSize = Tamanho().obs;

  int totalStock(ProdutoDto produtoDto) {
    int stock = 0;
    for (final size in produtoDto.tamanhos) {
      stock = size.stock;
    }
    return stock;
  }

  Tamanho get selectedSize => _selectedSize.value;

  set selectedSize(value) {
    _selectedSize.value = value;
    update();
  }

  List<ProdutoDto> get prd => _prd.value;

  set prd(value) {
    _prd.value = value;
  }

  get id => _id.value;

  set id(value) {
    _id.value = value;
  }

  get search => _search.value;

  set search(value) {
    _search.value = value;
  }

  List<ProdutoDto> get filteredProducts {
    final List<ProdutoDto> filteredProducts = [];
    if (search.isEmpty) {
      filteredProducts.addAll(prd);
    } else {
      filteredProducts.addAll(prd
          .where((p) => p.nome.toLowerCase().contains(search.toLowerCase())));
    }

    return filteredProducts;
  }

  readAll() async {
    prd = await repository.readAll();
  }

  ProdutoDto findProductById(int id) {
    try {
      return prd.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}
