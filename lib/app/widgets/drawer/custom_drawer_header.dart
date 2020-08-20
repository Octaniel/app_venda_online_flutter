import 'package:Venda_Online_Ui/app/app_controller.dart';
import 'package:Venda_Online_Ui/app/data/model/usuario.dart';
import 'package:Venda_Online_Ui/app/data/provider/seguranca.dart';
import 'package:Venda_Online_Ui/app/data/repository/seguranca_repository.dart';
import 'package:Venda_Online_Ui/app/modules/seguranca/seguranca_controller.dart';
import 'package:Venda_Online_Ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class CustomDrawerHeader extends GetView<AppController> {
  SegurancaController sc = SegurancaController(SegurancaRepository(apiClient: Seguranca(httpClient: http.Client())));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
      height: 180,
      child: GetX<Usuario>(builder: (us) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Loja do\nDaniel',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Olá, ${us.nome.value ?? ''}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (us.nome.value != '') {
                  sc.logout();
//                  Modular.to.pushNamed("/");
                } else {
                  Get.toNamed(Routes.SEGURANCA);
                }
              },
              child: Text(
                us.nome.value != ''
                    ? 'Sair'
                    : 'Entre ou cadastre--se >',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
