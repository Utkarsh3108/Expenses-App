import 'package:expenses_by_utkarsh/widgets/statistics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transactions.dart';
class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionsdata=Provider.of<Transactions>(context);

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 60),
        children: [
          Align(alignment: Alignment.center ,child: Text("The Distribuation of Expense",style: TextStyle(fontSize: 30,color: Colors.white),)),
          SizedBox(height:20),
          Statistics("Total",TextStyle(color: Colors.amber,fontSize: 30), transactionsdata.totalAmount),
          Statistics("Cash",TextStyle(color: Colors.green,fontSize: 30),transactionsdata.totalAmountCash),
          Statistics("E-Wallet", TextStyle(color: Colors.blue,fontSize: 30),transactionsdata.totalAmountEWallet),
          Statistics("Bank",TextStyle(color: Colors.red,fontSize: 30),transactionsdata.totalAmountBank),
          Statistics("Credit Card",TextStyle(color: Colors.blueGrey,fontSize: 30), transactionsdata.totalAmountCredit),
        ],
        ),
    );
  }
}