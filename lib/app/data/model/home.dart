import 'imagem_model.dart';

class HomeModel {
  int id;
  String nome;
  String tipo;
  List<ImagemModel> imagens;

  HomeModel({this.id, this.nome, this.tipo, this.imagens});

  HomeModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.tipo = json['tipo'];
    imagens = json['imagens'].map<ImagemModel>((e) => ImagemModel.fromJsonProduto(e)).toList();
  }

  HomeModel.fromJsonQ(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['tipo'] = this.tipo;
    data['imagens'] = this.imagens;
    return data;
  }

  @override
  String toString() {
    return "Home{id:$id, nome:$nome, tipo:$tipo, image:$imagens}";
  }
}
