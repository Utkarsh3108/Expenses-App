import 'package:flutter/material.dart';

class Account with ChangeNotifier {
  final String type;
  final Icon icon;
  int balance;
  final String name;

  Account(
      {@required this.type,
      @required this.icon,
      @required this.name,
      this.balance = 0});
  void addBalance(int addedAmount) {
    balance += addedAmount;
    notifyListeners();
  }
  void deductBalance(int addedAmount) {
    balance -= addedAmount;
    notifyListeners();
  }

}
