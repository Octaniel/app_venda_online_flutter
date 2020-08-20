import 'dart:convert';

import 'package:Venda_Online_Ui/app/data/model/usuario.dart';
import 'package:Venda_Online_Ui/app/res/static.dart';
import 'package:cross_local_storage/cross_local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Seguranca {
  final http.Client httpClient;

  Seguranca({@required this.httpClient});

  Future<int> login(String senha, String email) async {
    String login = "username=$email&password=$senha&grant_type=password";
    int erro;
    LocalStorageInterface localStorage = await LocalStorage.getInstance();
    var response = await httpClient.post("${url}oauth/token",
        headers: {
          'Content-Type': "application/x-www-form-urlencoded",
          "Authorization": "Basic YW5ndWxhcjpAbmd1bEByMA==",
          "bmobile": "ff",
        },
        body: login);
    erro = response.statusCode;
    if (response.statusCode == 200) {
      var decod = response.body;
      var jsond = jsonDecode(decod);
      print(jsond["carrinhoId"]);
      localStorage.setString("nomeUsuario", jsond["nome"]);
      localStorage.setInt("idUsuario", jsond["idUsuario"]);
      localStorage.setString("emailUsuario", jsond["email"]);
      localStorage.setStringList("grupos", jsond["grupos"]);
      localStorage.setInt("carrinhoId", jsond["carrinhoId"] as int);
      print(localStorage.get("carrinhoId"));
      localStorage.setString("access_token", jsond["access_token"]);
      localStorage.setString("date_expires_in", DateTime.now().toString());
      localStorage.setInt("expires_in", jsond["expires_in"]);
      localStorage.setString("refresh_token", jsond["refresh_token"]);
      Get.find<Usuario>().setUser();
    }
    return erro;
  }

  Future<bool> logout() async {
    Get.find<Usuario>().zerar();
    LocalStorageInterface localStorage = await LocalStorage.getInstance();
    return await localStorage.clear();
  }

  Future<String> cadastrar(Usuario usuario) async {
    String ret = "";
    var jsonEncod = jsonEncode(usuario.toJson());
    var post = await httpClient.post(
      "${url}usuario/salvar",
      headers: {"Content-Type": "application/json"},
      body: jsonEncod,
    );
    print(post.statusCode);
    if (post.statusCode == 201) {
      await login(usuario.senha.value, usuario.email.value);
      return "true";
    } else if (post.statusCode == 400) {
      var body = post.body;
      body = decoder(body);
      List decode = jsonDecode(body);
      decode.forEach((element) {
        ret = element["mensagemUsuario"];
      });
    }
    return ret;
  }

  String decoder(String body) {
    String decode = "";
    print(body);
    body.split("").forEach((element) {
      if (element == "Ã")
        decode = decode + "á";
      else if (element != "¡") decode = decode + element;
    });
    return decode;
  }

//  getAll() async {
//    try {
//      var response = await httpClient.get(url);
//      if (response.statusCode == 200) {
//        Map<String, dynamic> jsonResponse = json.decode(response.body);
//        List<Usuario> listMyModel = jsonResponse['data'].map<Usuario>((map) {
//          return Usuario.fromJson(map);
//        }).toList();
//        return listMyModel;
//      } else
//        print('erro -get');
//    } catch (_) {
//      print("Erro");
//    }
//  }
//
//  getId(id) async {
//    try {
//      var response = await httpClient.get(url);
//      if (response.statusCode == 200) {
//        Map<String, dynamic> jsonResponse = json.decode(response.body);
//        // TODO: implement methods!
//      } else
//        print('erro -get');
//    } catch (_) {}
//  }
//
//  add(obj) async {
//    try {
//      var response = await httpClient.post(url,
//          headers: {'Content-Type': 'application/json'}, body: jsonEncode(obj));
//      if (response.statusCode == 200) {
//        // TODO: implement methods!
//      } else
//        print('erro -post');
//    } catch (_) {}
//  }
//
//  edit(obj) async {
//    try {
//      var response = await httpClient.put(url,
//          headers: {'Content-Type': 'application/json'}, body: jsonEncode(obj));
//      if (response.statusCode == 200) {
//        // TODO: implement methods!
//      } else
//        print('erro -post');
//    } catch (_) {}
//  }
//
//  delete(obj) async {
//    try {
//      var response = await httpClient.delete(url);
//      if (response.statusCode == 200) {
//        // TODO: implement methods!
//      } else
//        print('erro -post');
//    } catch (_) {}
//  }
}
