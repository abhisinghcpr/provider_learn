import 'package:flutter/material.dart';

class TestProvider with ChangeNotifier {
  // get
  List<int> _numbers = [1, 2, 3, ];

  List<int> get getNumber => _numbers;

  // add
  addNumber(int data) {
    _numbers.add(data);
    notifyListeners();
  }

  // update
  updateNumber(int index, int value) {
    _numbers[index] = value;
    notifyListeners();
  }

  // delete

  deleteNumber(int index) {
    _numbers.removeAt(index);
    notifyListeners();
  }
}