import 'dart:convert';

import 'package:Venda_Online_Ui/app/data/model/item_carrinho.dart';
import 'package:Venda_Online_Ui/app/modules/produto/item_carrinho_controller.dart';
import 'package:Venda_Online_Ui/app/res/static.dart';
import 'package:cross_local_storage/cross_local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ItemCarrinhoProvider {
  final http.Client httpClient;

  ItemCarrinhoProvider({@required this.httpClient});

  Future<List<ItemCarrinho>> readItemCarrinho(int carrinhoId) async {
    LocalStorageInterface localStorage = await LocalStorage.getInstance();
    var response = await httpClient.get(
      "${url}iCarrinho?carrinhoId=$carrinhoId",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${localStorage.get("access_token")}"
      },
    );
    if (response.statusCode == 200) {
      List<ItemCarrinho> list = List();
      List data = jsonDecode(response.body);
      data.forEach((element) {
        list.add(ItemCarrinho.fromJson(element));
      });
      return list;
    }
    return List<ItemCarrinho>();
  }

  Future<void> addItemCarrinho(ItemCarrinho itemCarrinho) async {
    LocalStorageInterface localStorage = await LocalStorage.getInstance();
    var response = await httpClient.post(
      "${url}iCarrinho",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${localStorage.get("access_token")}"
      },
      body: itemCarrinho.encod(),
    );
    if (response.statusCode == 200) {
      if (itemCarrinho.quantidade == 0)
        Get.find<ItemCarrinhoController>().readItemCarrinho();
    }
  }
}
