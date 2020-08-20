import 'dart:io';
import 'package:Venda_Online_Ui/app/data/model/produto_dto.dart';
import 'package:Venda_Online_Ui/app/modules/produto/produto_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListTile extends GetWidget<ProdutoController> {
  ProductListTile(this.product);

  final ProdutoDto product;

  @override
  Widget build(BuildContext context) {
    var file = File(product.imagens.first.url);
    return GestureDetector(
      onTap: () {
        Get.toNamed("/produto/info", arguments: product);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: Image.memory(file.readAsBytesSync()),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.nome,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        'A partir de',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Text(
                      'R\$ 19.99',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
