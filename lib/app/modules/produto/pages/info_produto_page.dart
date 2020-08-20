import 'dart:io';

import 'package:Venda_Online_Ui/app/data/model/produto_dto.dart';
import 'package:Venda_Online_Ui/app/data/model/usuario.dart';
import 'package:Venda_Online_Ui/app/modules/produto/item_carrinho_controller.dart';
import 'package:Venda_Online_Ui/app/modules/produto/produto_controller.dart';
import 'package:Venda_Online_Ui/app/modules/produto/widgets/size_widget.dart';
import 'package:Venda_Online_Ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class InfoProdutoPage extends GetView<ProdutoController> {
  ProdutoDto _produtoDto = Get.arguments;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    print(_produtoDto);

    return Scaffold(
        appBar: AppBar(
          title: Text(_produtoDto.nome),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: PageView(
                onPageChanged: (i) {
                  print(i);
                  controller.id = i;
                },
                controller: _pageController,
                children: _produtoDto.imagens.map((e) {
                  return Stack(
                    children: [
                      Image.memory(File(e.url).readAsBytesSync()),
                      Align(
                        child: Container(
                          child: Row(
                            children: _produtoDto.imagens
                                .map(
                                  (x) => GetX(
                                    builder: (value) {
                                      return Container(
                                        margin: EdgeInsets.only(left: 8),
                                        height: 12,
                                        width: 12,
                                        decoration: ShapeDecoration(
                                          color: controller.id ==
                                                  _produtoDto.imagens
                                                      .indexOf(x)
                                              ? Colors.greenAccent
                                              : Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                                .toList(),
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    _produtoDto.nome,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'A partir de',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    'R\$ 19.99',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Descrição',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    _produtoDto.descricao,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Tamanhos',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _produtoDto.tamanhos.map((s) {
                      return SizeWidget(size: s);
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (controller.totalStock(_produtoDto) > 0)
                    GetBuilder<ProdutoController>(builder: (value) {
                      return GetBuilder<Usuario>(
                        builder: (us) {
                          return SizedBox(
                            height: 44,
                            child: RaisedButton(
                              onPressed: value.selectedSize.id != null
                                  ? () {
                                      if (us.nome.value != '') {
                                        Get.find<ItemCarrinhoController>()
                                            .addItemCarrinho(_produtoDto);
                                        Get.toNamed(Routes.CARRINHO);
                                      } else {
                                        Get.toNamed(Routes.SEGURANCA);
                                      }
                                    }
                                  : null,
                              color: primaryColor,
                              textColor: Colors.white,
                              child: Text(
                                us.nome.value != ''
                                    ? 'Adicionar ao Carrinho'
                                    : 'Entre para Comprar',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                ],
              ),
            )
          ],
        ));
  }
}
