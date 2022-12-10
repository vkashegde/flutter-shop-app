import 'package:flutter/material.dart';
import 'package:provydr/sample1/data_model.dart';

class Appstate extends ChangeNotifier {
  int temp = 0;

  void updateTemp(int temp) {
    this.temp = temp;
    notifyListeners();
  }

  void clearTemp() {
    this.temp = 0;
    notifyListeners();
  }

  List<DataModel> dataList = [];

  void updateDataModel(List<DataModel> dataList) {
    this.dataList = dataList;
    notifyListeners();
  }
}
