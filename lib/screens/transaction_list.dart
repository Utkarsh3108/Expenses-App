import 'package:expenses_by_utkarsh/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transactions.dart';
class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionsdata=Provider.of<Transactions>(context);
    final transactions=transactionsdata.transactions;

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 60),
        itemCount: transactions.length,
        itemBuilder: (ctx,i) => TransactionItem(
          transactions[i].date,
          transactions[i].amount,
          transactions[i].title,
        ),
      ),
    );
  }
}