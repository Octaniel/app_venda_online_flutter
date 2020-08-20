import 'package:Venda_Online_Ui/app/data/provider/produto.dart';
import 'package:flutter/material.dart';

class ProdutoRepository {
  final Produto apiClient;

  ProdutoRepository({@required this.apiClient}) : assert(apiClient != null);

  readAll(){
    return apiClient.readAll();
  }
}