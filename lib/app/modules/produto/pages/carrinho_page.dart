import 'package:Venda_Online_Ui/app/modules/produto/widgets/card_tile.dart';
import 'package:Venda_Online_Ui/app/widgets/card_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../item_carrinho_controller.dart';
import '../produto_controller.dart';

class CarrinhoPage extends GetView<ItemCarrinhoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
        centerTitle: true,
      ),
      body: GetBuilder<ItemCarrinhoController>(
        builder: (value) {
          if (controller.itensCarrinho.isEmpty) {
            controller.readItemCarrinho();
            Get.find<ProdutoController>().readAll();
          }
          return ListView(
            children: [
              Column(
                children:
                    controller.itensCarrinho.map((e) => CardTile(e)).toList(),
              ),
              GetBuilder<ItemCarrinhoController>(
                builder: (value) {
                  return CardPrice(
                    buttonText: 'Continuar para Entrega',
                    onPressed: value.isCartValid()
                        ? () {
                            print(true);
                          }
                        : null,
                  );
                },
                id: "cardPreco",
              )
            ],
          );
        },
      ),
    );
  }
}
