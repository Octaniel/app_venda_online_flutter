import 'dart:convert';

import 'package:Venda_Online_Ui/app/data/model/produto_dto.dart';

class ItemCarrinho {
  int id;
  int quantidade;
  String tamanho;
  Carrinho carrinho;
  ProdutoDto produto;

  ItemCarrinho({
    this.id,
    this.quantidade,
    this.tamanho,
    this.carrinho,
    this.produto,
  });

  ItemCarrinho.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantidade = json['quantidade'];
    tamanho = json['tamanho'];
    produto = ProdutoDto.fromJson(json['produto']);
    carrinho = Carrinho.fromJson(json['carrinho']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantidade'] = this.quantidade;
    data['carrinho'] = this.carrinho.toJson();
    data['tamanho'] = this.tamanho;
    data['produto'] = this.produto.toJsonSalvarItemCarrinho();
    return data;
  }

  encod() {
    print("$toJson() eeee");
    return jsonEncode(this);
  }

  num get preco {
    return produto.tamanhos
            .firstWhere((element) => element.nome == tamanho)
            .preco *
        quantidade;
  }

  bool get hasStock {
    final size =
        produto.tamanhos.firstWhere((element) => element.nome == tamanho);
    if (size == null) return false;
    return size.stock >= quantidade;
  }
}

class Carrinho {
  int id;

  Carrinho(this.id);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }

  Carrinho.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }
}
