import 'package:Venda_Online_Ui/app/data/model/item_carrinho.dart';
import 'package:Venda_Online_Ui/app/data/provider/item_carrinho_provider.dart';
import 'package:flutter/material.dart';

class ItemCarrinhoRepository {
  final ItemCarrinhoProvider apiClient;

  ItemCarrinhoRepository({@required this.apiClient})
      : assert(apiClient != null);

  readItemCarrinho(int carrinhoId) {
    return apiClient.readItemCarrinho(carrinhoId);
  }

  Future<void> addItemCarrinho(ItemCarrinho itemCarrinho) async {
    await apiClient.addItemCarrinho(itemCarrinho);
  }
}
