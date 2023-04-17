import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Transaction {
  DateTime id;
  String title;
  int amount;
  String type;
  DateTime date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.type,
    @required this.date,
  });
}