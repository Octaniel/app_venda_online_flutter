import 'package:Venda_Online_Ui/app/data/model/grupo_model.dart';
import 'package:cross_local_storage/cross_local_storage.dart';
import 'package:get/get.dart';

class Usuario extends GetxController {
  var id = 0.obs;
  var nome = ''.obs;
  var email = ''.obs;
  var senha = ''.obs;
  var confirmacaoSenha = ''.obs;
  var carrinhoId = 0.obs;
  var grupos = List<String>().obs;

  Usuario() {
    setUser();
  }

  Usuario.fromJson(Map<String, dynamic> json) {
    id.value = json['idUsuario'];
    nome.value = json['nome'];
    email.value = json['email'];
    senha.value = json['senha'];
    confirmacaoSenha.value = json['confirmacaoSenha'];
    carrinhoId.value = json['carrinhoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.value;
    data['nome'] = this.nome.value;
    data['email'] = this.email.value;
    data['senha'] = this.senha.value;
    data['confirmacaoSenha'] = this.confirmacaoSenha.value;
    // data['carrinhoId'] = this.carrinhoId.value;
    return data;
  }

  Future<Usuario> setUser() async {
    LocalStorageInterface localStorage = await LocalStorage.getInstance();
    id.value = localStorage.get("idUsuario");
    nome.value = localStorage.get("nomeUsuario");
    email.value = localStorage.get("emailUsuario");
    carrinhoId.value = localStorage.get("carrinhoId");
    grupos.value = (localStorage.get("grupos") as List<dynamic> ?? List<String>()).map((e) => e.toString()).toList();
    print('${grupos.value}->grupos.value');
    update();
    return this;
  }

  zerar() {
    nome.value = '';
    email.value = '';
    carrinhoId.value = 0;
  }
  
 bool get isAdmin => grupos.value.firstWhere((element) => element=="Administrador",orElse: null)!=null;
}
