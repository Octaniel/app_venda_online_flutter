import 'package:Venda_Online_Ui/app/data/model/item_carrinho.dart';
import 'package:Venda_Online_Ui/app/data/model/produto_dto.dart';
import 'package:Venda_Online_Ui/app/data/model/usuario.dart';
import 'package:Venda_Online_Ui/app/data/repository/item_carrinho_repository.dart';
import 'package:Venda_Online_Ui/app/modules/produto/produto_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemCarrinhoController extends GetxController {
  final ItemCarrinhoRepository repository;

  ItemCarrinhoController({@required this.repository})
      : assert(repository != null);

  var _itensCarrinho = List<ItemCarrinho>().obs;

  int carrinhoId = Get.find<Usuario>().carrinhoId.value;

  List<ItemCarrinho> get itensCarrinho => _itensCarrinho.value;

  set itensCarrinho(value) {
    _itensCarrinho.value = value;
  }

  readItemCarrinho() async {
    itensCarrinho = await repository.readItemCarrinho(carrinhoId);
    update();
  }

  double precoItemCarrinho(ItemCarrinho itemCarrinho) {
    Get.find<ProdutoController>().readAll();
    print(Get.find<ProdutoController>().prd.length);
    var firstWhere = Get.find<ProdutoController>()
        .prd
        .firstWhere((element) => element.nome == itemCarrinho.produto.nome);
    return firstWhere.tamanhos
        .firstWhere((element) => element.nome == itemCarrinho.tamanho)
        .preco;
  }

  addItemCarrinho(ProdutoDto produtoDto) async {
    var nome = Get.find<ProdutoController>().selectedSize.nome;
    try {
      ItemCarrinho firstWhere = itensCarrinho.firstWhere((element) =>
          element.produto.nome == produtoDto.nome && element.tamanho == nome);
      firstWhere.quantidade++;
      repository.addItemCarrinho(firstWhere);
    } catch (e) {
      ItemCarrinho itemCarrinho = ItemCarrinho(
          quantidade: 1,
          produto: produtoDto,
          tamanho: nome,
          carrinho: Carrinho(carrinhoId));
      await repository.addItemCarrinho(itemCarrinho);
      readItemCarrinho();
    }
    // update();
  }

  void increment(ItemCarrinho itemCarrinho) {
    ItemCarrinho firstWhere = itensCarrinho.firstWhere((element) =>
        element.produto.nome == itemCarrinho.produto.nome &&
        element.tamanho == itemCarrinho.tamanho);
    firstWhere.quantidade++;
    update([
      itemCarrinho.id.toString(),
      itemCarrinho.id.toString() + "1",
      "cardPreco"
    ]);
    repository.addItemCarrinho(firstWhere);
  }

  void decrement(ItemCarrinho itemCarrinho) {
    ItemCarrinho firstWhere = itensCarrinho.firstWhere((element) =>
        element.produto.nome == itemCarrinho.produto.nome &&
        element.tamanho == itemCarrinho.tamanho);
    firstWhere.quantidade--;
    update([
      itemCarrinho.id.toString(),
      itemCarrinho.id.toString() + "1",
      "cardPreco"
    ]);
    repository.addItemCarrinho(firstWhere);
  }

  bool isCartValid() {
    bool b = true;
    itensCarrinho.forEach((element) {
      if (!element.hasStock) {
        b = false;
      }
    });
    return b;
  }

  num get precoGeral {
    num precoGeral = 0.0;
    itensCarrinho.forEach((element) {
      precoGeral += element.preco;
    });
    return precoGeral;
  }
}
