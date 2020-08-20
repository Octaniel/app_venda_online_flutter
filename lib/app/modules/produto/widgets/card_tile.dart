import 'dart:io';

import 'package:Venda_Online_Ui/app/data/model/item_carrinho.dart';
import 'package:Venda_Online_Ui/app/modules/produto/item_carrinho_controller.dart';
import 'package:Venda_Online_Ui/app/widgets/custom_icon_buton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class CardTile extends GetWidget<ItemCarrinhoController> {
  ItemCarrinho itemCarrinho;

  CardTile(this.itemCarrinho);

  @override
  Widget build(BuildContext context) {
    var file = File(itemCarrinho.produto.imagens.first.url);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: Image.memory(file.readAsBytesSync()),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemCarrinho.produto.nome,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Tamanho: ${itemCarrinho.tamanho}",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                    GetBuilder<ItemCarrinhoController>(
                        builder: (value) {
                          if (itemCarrinho.hasStock)
                            return "R\$ ${controller.precoItemCarrinho(itemCarrinho).toStringAsFixed(2)}"
                                .text
                                .color(Theme.of(context).primaryColor)
                                .size(16)
                                .bold
                                .make();
                          else
                            return 'Sem estoque suficiente'
                                .text
                                .color(Colors.red)
                                .size(12)
                                .make();
                        },
                        id: itemCarrinho.id.toString() + "1"),
                  ],
                ),
              ),
            ),
            GetBuilder<ItemCarrinhoController>(
              builder: (value) {
                return Column(
                  children: <Widget>[
                    CustomIconButton(
                      iconData: Icons.add,
                      color: Theme.of(context).primaryColor,
                      onTap: () => controller.increment(itemCarrinho),
                    ),
                    Text(
                      '${itemCarrinho.quantidade}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    CustomIconButton(
                      iconData: Icons.remove,
                      color: itemCarrinho.quantidade > 1
                          ? Theme.of(context).primaryColor
                          : Colors.red,
                      onTap: () => controller.decrement(itemCarrinho),
                    ),
                  ],
                );
              },
              id: itemCarrinho.id.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
