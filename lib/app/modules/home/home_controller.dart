import 'package:Venda_Online_Ui/app/data/model/home.dart';
import 'package:Venda_Online_Ui/app/data/model/usuario.dart';
import 'package:Venda_Online_Ui/app/data/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  final HomeRepository repository;

  HomeController({@required this.repository}) : assert(repository != null);

  var _homeList = List<HomeModel>().obs;

  List<HomeModel> get homeList => _homeList.value;

  set homeList(List<HomeModel> value) {
    _homeList.value = value;
  }

  getAll() async {
    print('${Get.find<Usuario>().isAdmin}->Get.find<Usuario>().isAdmin');
    homeList = await repository.getAll();
    update();
  }
}
