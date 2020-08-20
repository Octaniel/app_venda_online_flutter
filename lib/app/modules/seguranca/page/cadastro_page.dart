import 'package:Venda_Online_Ui/app/data/model/usuario.dart';
import 'package:Venda_Online_Ui/app/modules/seguranca/seguranca_controller.dart';
import 'package:Venda_Online_Ui/app/res/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CadastroPage
    extends GetView<SegurancaController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Usuario usuario = Usuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: GetX<SegurancaController>(builder: (seg){
              return ListView(
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                children: <Widget>[
                  TextFormField(
                    enabled: !seg.loading,
                    decoration: const InputDecoration(hintText: 'Nome Completo'),
                    validator: (name) {
                      if (name.isEmpty)
                        return 'Campo obrigatório';
                      else if (name.trim().split(' ').length <= 1)
                        return 'Preencha seu Nome completo';
                      return null;
                    },
                    onSaved: (v) => usuario.nome.value = v,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    enabled: !seg.loading,
                    decoration: const InputDecoration(hintText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email.isEmpty)
                        return 'Campo obrigatório';
                      else if (emailValid(email)) return 'E-mail inválido';
                      return null;
                    },
                    onSaved: (v) => usuario.email.value = v,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    enabled: !seg.loading,
                    decoration: const InputDecoration(hintText: 'Senha'),
                    obscureText: true,
                    validator: (pass) {
                      if (pass.isEmpty)
                        return 'Campo obrigatório';
                      else if (pass.length < 6) return 'Senha muito curta';
                      return null;
                    },
                    onChanged: (v) => usuario.senha.value = v,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    enabled: !seg.loading,
                    decoration: const InputDecoration(hintText: 'Confirme a Senha'),
                    obscureText: true,
                    validator: (pass) {
                      if (pass.isEmpty)
                        return 'Campo obrigatório';
                      else if (pass.length < 6) return 'Senha muito curta';
                      else if (usuario.senha.value != pass) return "Confirmação da senha não pode ser diferente da senha";
                      return null;
                    },
                    onSaved: (v) => usuario.confirmacaoSenha.value = v,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 44,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                      textColor: Colors.white,
                      onPressed: seg.loading?null: () {
                        validar();
                      },
                      child: seg.loading
                          ? CircularProgressIndicator(
                        valueColor:
                        AlwaysStoppedAnimation(Colors.white),
                      )
                          :  const Text(
                        'Criar Conta',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  void validar() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      var s = await controller.cadastrar(usuario);
      if (s == "true") {
        Get.back();
      } else if(s.isNotEmpty) {
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Align(
            heightFactor: 1,
            alignment: Alignment.bottomCenter,
            child: Text(s),
          ),
          backgroundColor: Colors.red,
        ));
      }else{
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Align(
            heightFactor: 1,
            alignment: Alignment.bottomCenter,
            child: Text("Ocoreu um erro desconhecido no cadastro"),
          ),
          backgroundColor: Colors.red,
        ));
      }
      //ota@gmail.com
    }
  }
}
