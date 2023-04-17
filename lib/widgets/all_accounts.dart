import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expenses_by_utkarsh/widgets/account_item.dart';
// import 'package:expenses_by_utkarsh/data.dart';
import '../providers/accounts.dart';

class AllAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final accountsdata = Provider.of<Accounts>(context);
    final accounts = accountsdata.accounts;
    return Flexible(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
        itemCount: accounts.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value:accounts[i],
          child: AccountItem(
            // type: accounts[i].type,
            // icon: accounts[i].icon,
            // balance: accounts[i].balance,
            // name: accounts[i].name,
          ),
        ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 170,
          childAspectRatio: 0.56 / 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
