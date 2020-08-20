import 'package:Venda_Online_Ui/app/data/model/usuario.dart';
import 'package:Venda_Online_Ui/app/data/provider/seguranca.dart';
import 'package:flutter/material.dart';

class SegurancaRepository {
  final Seguranca apiClient;

  SegurancaRepository({@required this.apiClient}) : assert(apiClient != null);

//  getAll() {
//    return apiClient.getAll();
//  }

  login(String senha, String email){
    return apiClient.login(senha, email);
  }

  logout(){
    return apiClient.logout();
  }

  cadastrar(Usuario usuario){
    return apiClient.cadastrar(usuario);
  }

//  getId(id) {
//    return apiClient.getId(id);
//  }
//
//  delete(id) {
//    return apiClient.delete(id);
//  }
//
//  edit(obj) {
//    return apiClient.edit(obj);
//  }
//
//  add(obj) {
//    return apiClient.add(obj);
//  }
}
