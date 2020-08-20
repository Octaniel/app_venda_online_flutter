import 'package:Venda_Online_Ui/app/data/provider/home_provider.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

class HomeRepository {
  final HomeApiClient apiClient;

  HomeRepository({@required this.apiClient}) : assert(apiClient != null);

  getAll() {
    return apiClient.getAll();
  }

  getId(id) {
    return apiClient.getId(id);
  }

  delete(id) {
    return apiClient.delete(id);
  }

  edit(obj) {
    return apiClient.edit(obj);
  }

  add(obj) {
    return apiClient.add(obj);
  }
}
