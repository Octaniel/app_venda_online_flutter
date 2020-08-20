import 'package:Venda_Online_Ui/app/data/model/tamanho.dart';

import 'imagem_model.dart';

class ProdutoDto {
  int id;
  String nome;
  String descricao;
  List<ImagemModel> imagens;
  List<Tamanho> tamanhos;

  ProdutoDto(
      {this.id, this.nome, this.descricao, this.imagens, this.tamanhos});

  ProdutoDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    print(json['imagens']);
    imagens = (json['imagens'] as List ?? []).map((e) => ImagemModel.fromJsonHome(e)).toList();
    tamanhos = (json['tamanhos'] as List ?? [])
        .map((e) => Tamanho.fromJson(e))
        .toList();
  }

  ProdutoDto.fromJsonSemImagens(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['imagens'] = this.imagens;
    return data;
  }

  Map<String, dynamic> toJsonSalvarItemCarrinho() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    return data;
  }

  @override
  String toString() {
    return 'ProdutoDto{id: $id, nome: $nome, descricao: $descricao, imagens: $imagens, tamanhos: $tamanhos}';
  }
}
