import 'package:Venda_Online_Ui/app/data/model/home.dart';
import 'package:Venda_Online_Ui/app/data/model/produto_dto.dart';

class ImagemModel{
  int id;
  String url;
  HomeModel home;
  ProdutoDto produto;

  ImagemModel({this.id, this.url, this.home, this.produto});

  ImagemModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.url = json['url'];
    this.home = HomeModel.fromJson(json['home']);
    this.produto = ProdutoDto.fromJson(json['produto']);
  }

  ImagemModel.fromJsonHome(Map<String, dynamic> json) {
    this.id = json['id'];
    this.url = json['url'];
    this.home = HomeModel.fromJsonQ(json['home']);
  }

  ImagemModel.fromJsonProduto(Map<String, dynamic> json) {
    this.id = json['id'];
    this.url = json['url'];
    this.produto = ProdutoDto.fromJsonSemImagens(json['produto']);
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['home'] = this.home.toJson();
    data['produto'] = this.produto.toJson();
    return data;
  }

  @override
  String toString() {
    return 'ImagemModel{id: $id, url: $url, home: $home, produto: $produto}';
  }
}