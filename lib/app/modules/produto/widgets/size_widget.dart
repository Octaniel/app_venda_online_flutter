import 'package:Venda_Online_Ui/app/data/model/tamanho.dart';
import 'package:Venda_Online_Ui/app/modules/produto/produto_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeWidget extends GetWidget<ProdutoController> {
  SizeWidget({this.size});

  final Tamanho size;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProdutoController>(
        builder: (value) {
          final selected = size == value.selectedSize;
          Color color;
          if (!size.hasStock)
            color = Colors.red.withAlpha(50);
          else if (selected)
            color = Theme.of(context).primaryColor;
          else
            color = Colors.grey;
          return GestureDetector(
            onTap: () {
              if (size.hasStock) {
                value.selectedSize = size;
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: color),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    color: color,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Text(
                      size.nome,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'R\$ ${size.preco.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: color,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
