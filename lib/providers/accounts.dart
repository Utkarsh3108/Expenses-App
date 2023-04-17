import 'package:flutter/material.dart';
import '../models/account.dart';

class Accounts with ChangeNotifier {
  List<Account> _accounts = [
    Account(
        type: 'Cash',
        name: 'Cash',
        balance: 00,
        icon: Icon(
          Icons.money,
          color: Colors.green,
        )),
    Account(
        type: 'Bank',
        name: 'Bank Account',
        balance: 00,
        icon: Icon(
          Icons.home_work_outlined,
          color: Colors.red,
        )),
    Account(
        type: 'E-Wallet',
        name: 'E-Wallet',
        balance: 00,
        icon: Icon(
          Icons.account_balance_wallet,
          color: Colors.blue,
        )),
    Account(
      type: 'Credit Card',
      name: 'Credit Card',
      balance: 00,
      icon: Icon(
        Icons.credit_card_rounded,
        color: Colors.blueGrey,
      ),
    ),
  ];
  List<Account> get accounts{
    return [..._accounts];
  }

  // void addBalance(String type,int addedAmount){
  //   print(addedAmount);
  //   int i=0;
  //   while(i<4)
  //   {
  //     if(_accounts[i].type==type)
  //     {
  //       _accounts[i].balance+=addedAmount;
  //       print("HIii${_accounts[i].balance}");
  //       notifyListeners();
  //       break;
  //     }
  //     i++;
  //   }
  // }
  
  void reduceBalance(int deductedAmount,String type)
  {
    int i=0;
    while(i<4)
    {
      if(_accounts[i].type==type)
      {
        _accounts[i].balance-=deductedAmount;
        notifyListeners();
        break;
      }
      i++;
    }
  }
} 
