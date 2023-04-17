import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transactions.dart';
import '../models/account.dart';

class AccountItem extends StatelessWidget {
  // final Icon icon;
  // final String type;
  // final String name;
  // final int balance;

  // AccountItem({this.type, this.icon, this.balance = 0, this.name});

  void selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).pushNamed(
    //   CategoryMealsScreen.routeName,
    //   arguments: {
    //     "id": id,
    //     "title": title,
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<Account>(context);

    final transactionsdata = Provider.of<Transactions>(context);
    final transactions = transactionsdata.transactions;

    int total = 0;
    transactions.forEach((element) {
      if (element.type == account.type) {
        total += element.amount;
      }
    });

    return InkWell(
      onTap: () => {},
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
        child: Column(
          children: [
            Align(alignment: Alignment.topCenter, child: account.icon),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                account.type,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Balance : ₹${account.balance - total}",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: 160,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: transactions.length,
                itemBuilder: (ctx, i) => transactions[i].type == account.type
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            transactions[i].title,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          Text(
                            "₹${transactions[i].amount}",
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                        ],
                      )
                    : SizedBox(),
              ),
            ),
            SizedBox(height: 17),
            IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildPopupDialog(account.type, context, account),
                );
              },
              color: Colors.green,
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(String type, BuildContext context, Account account) {
  TextEditingController amountController = new TextEditingController();
  print(amountController);
  return new AlertDialog(
    title: const Text('Add Amount'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: amountController,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Amount will be added to balance',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        )
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          account.addBalance(int.parse(amountController.text.toString()));
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Done'),
      ),
    ],
  );
}
