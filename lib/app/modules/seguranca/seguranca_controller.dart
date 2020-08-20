import 'package:Venda_Online_Ui/app/data/model/usuario.dart';
import 'package:Venda_Online_Ui/app/data/repository/seguranca_repository.dart';
import 'package:get/get.dart';

class SegurancaController extends GetxController {
  final SegurancaRepository repository;

  SegurancaController(this.repository);

  var _loading = false.obs;

  get loading => _loading.value;

  set loading(value) {
    _loading.value = value;
  }

  Future<int> login(String senha, String email) async{
    loading = true;
    var login = await repository.login(senha, email);
    print(login);
    loading = false;
    return login;
  }

  Future<String> cadastrar(Usuario usuario) async{
    loading = true;
    var login = await repository.cadastrar(usuario);
    loading = false;
    return login;
  }

  Future<void> logout() async{
    repository.logout();
  }
}