import 'package:Venda_Online_Ui/app/data/model/home.dart';
import 'package:Venda_Online_Ui/app/res/static.dart';
import 'package:cross_local_storage/cross_local_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = 'locahost';

class HomeApiClient {
  final http.Client httpClient;
  HomeApiClient({@required this.httpClient});

  getAll() async {
    LocalStorageInterface localStorage = await LocalStorage.getInstance();
    try {
      var response = await httpClient.get('${url}home', headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${localStorage.get("access_token")}"
      });
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(decoder(response.body));
        List<HomeModel> listHomeModel = jsonResponse.map<HomeModel>((map) {
          return HomeModel.fromJson(map);
        }).toList();
        print(listHomeModel);
        return listHomeModel;
      } else
        print('erro -get');
    } catch (_) {}
  }

  String decoder(String body) {
    body = body.replaceAll("Ã§", "ç");
    body = body.replaceAll("Ãµ", "õ");
    body = body.replaceAll("Ã", "Ç");
    return body;
  }

  getId(id) async {
    try {
      var response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        // TODO: implement methods!
      } else
        print('erro -get');
    } catch (_) {}
  }

  add(obj) async {
    try {
      var response = await httpClient.post(baseUrl,
          headers: {'Content-Type': 'application/json'}, body: jsonEncode(obj));
      if (response.statusCode == 200) {
        // TODO: implement methods!
      } else
        print('erro -post');
    } catch (_) {}
  }

  edit(obj) async {
    try {
      var response = await httpClient.put(baseUrl,
          headers: {'Content-Type': 'application/json'}, body: jsonEncode(obj));
      if (response.statusCode == 200) {
        // TODO: implement methods!
      } else
        print('erro -post');
    } catch (_) {}
  }

  delete(obj) async {
    try {
      var response = await httpClient.delete(baseUrl);
      if (response.statusCode == 200) {
        // TODO: implement methods!
      } else
        print('erro -post');
    } catch (_) {}
  }
}
