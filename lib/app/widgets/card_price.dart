import 'package:Venda_Online_Ui/app/modules/produto/item_carrinho_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CardPrice extends GetWidget<ItemCarrinhoController> {
  final String buttonText;
  final Function onPressed;

  CardPrice({this.buttonText, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        'Resumo do Pedido'.text.start.extraBold.size(16).make(),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            'Subtotal'.text.make(),
            'R\$ ${controller.precoGeral.toStringAsFixed(2)}'.text.make(),
          ],
        ),
        const Divider(
          thickness: .5,
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            'Total'.text.semiBold.make(),
            'R\$ ${controller.precoGeral.toStringAsFixed(2)}'
                .text
                .size(16)
                .color(Theme.of(context).primaryColor)
                .make(),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        RaisedButton(
          color: Theme.of(context).primaryColor,
          disabledColor: Theme.of(context).primaryColor.withAlpha(100),
          textColor: Colors.white,
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      ],
    )
        .animatedBox
        .margin(EdgeInsets.symmetric(horizontal: 16, vertical: 8))
        .padding(EdgeInsets.fromLTRB(16, 16, 16, 4))
        .withRounded(value: 5)
        .shadow2xl
        .color(Colors.white)
        .make();
  }
}
