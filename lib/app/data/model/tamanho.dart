class Tamanho{
  int id;
  String nome;
  double preco;
  int stock;


  Tamanho();

  Tamanho.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    preco = json['preco'];
    stock = json['stock'];
  }

  get hasStock=> stock>0;

  @override
  String toString() {
    return 'Tamanho{id: $id, nome: $nome, preco: $preco, stock: $stock}';
  }

}