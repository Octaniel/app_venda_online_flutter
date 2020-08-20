import 'file:///C:/Users/otani/OneDrive/Documentos/flutter_projectos/vendaonlineui/lib/app/modules/produto/widgets/search_dialog.dart';
import 'package:Venda_Online_Ui/app/modules/produto/item_carrinho_controller.dart';
import 'package:Venda_Online_Ui/app/modules/produto/widgets/produto_list_tile.dart';
import 'package:Venda_Online_Ui/app/routes/app_pages.dart';
import 'package:Venda_Online_Ui/app/widgets/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../produto_controller.dart';

class ListaProdutoPage extends GetView<ProdutoController> {
  @override
  Widget build(BuildContext context) {
    controller.readAll();
    Get.find<ItemCarrinhoController>().readItemCarrinho();
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: GetX<ProdutoController>(builder: (value) {
          return value.search.isEmpty
              ? Text("Produtos")
              : LayoutBuilder(builder: (_, boxConstrant) {
                  return Container(
                    width: boxConstrant.biggest.width,
                    child: GestureDetector(
                      onTap: () async {
                        final search = await showDialog<String>(
                            context: context,
                            builder: (_) => SearchDialog(value.search));
                        if (search != null) {
                          value.search = search;
                        }
                      },
                      child: Text(
                        value.search,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                });
        }),
        centerTitle: true,
        actions: <Widget>[
          GetX<ProdutoController>(builder: (value) {
            return value.search.isEmpty
                ? IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) => SearchDialog(value.search));
                      if (search != null) {
                        controller.search = search;
                      }
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () async {
                      value.search = '';
                    },
                  );
          })
        ],
      ),
      body: GetX<ProdutoController>(
        builder: (productManager) {
          var filteredProducts = productManager.filteredProducts;
          return filteredProducts.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: productManager.search.isEmpty
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                        : Text(
                            "Nenhum Produto Encontrado",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(4),
                  itemCount: filteredProducts.length,
                  itemBuilder: (_, index) {
                    return ProductListTile(filteredProducts[index]);
                  });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Get.toNamed(Routes.CARRINHO);
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
