import 'dart:convert';

import 'package:Venda_Online_Ui/app/data/model/produto_dto.dart';
import 'package:Venda_Online_Ui/app/res/static.dart';
import 'package:cross_local_storage/cross_local_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Produto {
  final http.Client httpClient;

  Produto({@required this.httpClient});

  Future<List<ProdutoDto>> readAll() async {
    LocalStorageInterface localStorage = await LocalStorage.getInstance();
    var response = await httpClient.get(
      "${url}produto",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${localStorage.get("access_token")}"
      },
    );
    if (response.statusCode == 200) {
      List<ProdutoDto> list = List();
      List data = jsonDecode(response.body);
      data.forEach((element) {
        list.add(ProdutoDto.fromJson(element));
      });
      return list;
    }
    return List<ProdutoDto>();
  }
}
