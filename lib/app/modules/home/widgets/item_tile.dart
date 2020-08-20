import 'dart:io';

import 'package:Venda_Online_Ui/app/data/model/imagem_model.dart';
import 'package:Venda_Online_Ui/app/modules/produto/produto_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemTile extends StatelessWidget {
  const ItemTile(this.item);

  final ImagemModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (item.produto != null) {
          await Get.find<ProdutoController>().readAll();
          print("object");
          final product = Get.find<ProdutoController>()
         .findProductById(item.produto.id);
         if(product != null){
           Get.toNamed("/produto/info", arguments: product);
         }
        }
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: AspectRatio(
            aspectRatio: 1,
            child: Image.memory(
              File(item.url).readAsBytesSync(),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
