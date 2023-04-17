import 'package:flutter/material.dart';

import './accounts.dart';
import '../models/transaction.dart';
import '../models/account.dart';

class Transactions with ChangeNotifier {
  final _transactions = [
    // Transaction(
    //     id: DateTime.now(),
    //     type: 'Cash',
    //     title: 'Ice Cream',
    //     amount: 100,
    //     date: DateTime.now()),
    // Transaction(
    //     id: DateTime.now(),
    //     type: 'Bank',
    //     title: 'Shoes',
    //     amount: 5000,
    //     date: DateTime.now()),
    // Transaction(
    //     id: DateTime.now(),
    //     type: 'Bank',
    //     title: 'Shoes',
    //     amount: 5000,
    //     date: DateTime.now()),
    // Transaction(
    //     id: DateTime.now(),
    //     type: 'Bank',
    //     title: 'Clothes',
    //     amount: 2000,
    //     date: DateTime.now()),
  ];

  List<Transaction> get transactions {
    return [..._transactions];
  }

  void addTransaction(int amount, String type, String title, DateTime date) {
    Accounts().reduceBalance(amount, type);
    _transactions.add(Transaction(
      id: DateTime.now(),
      type: type,
      title: title,
      amount: amount,
      date: date,
    ));

    //_transactions.add(value);
    notifyListeners();
  }

  int get totalAmount {
    int i = 0;
    int total = 0;
    while (i < _transactions.length) {
      total += _transactions[i].amount;
      i++;
    }
    return total;
  }

  int get totalAmountCash {
    int i = 0;
    int total = 0;
    while (i < _transactions.length) {
      if (_transactions[i].type == 'Cash') {
        total += _transactions[i].amount;
      }
      i++;
    }
    return total;
  }
   int get totalAmountBank {
    int i = 0;
    int total = 0;
    while (i < _transactions.length) {
      if (_transactions[i].type == 'Bank') {
        total += _transactions[i].amount;
      }
      i++;
    }
    return total;
  }
   int get totalAmountCredit{
    int i = 0;
    int total = 0;
    while (i < _transactions.length) {
      if (_transactions[i].type == 'Credit Card') {
        total += _transactions[i].amount;
      }
      i++;
    }
    return total;
  }
   int get totalAmountEWallet{
    int i = 0;
    int total = 0;
    while (i < _transactions.length) {
      if (_transactions[i].type == 'E-Wallet') {
        total += _transactions[i].amount;
      }
      i++;
    }
    return total;
  }
}
