// import 'package:flutter/material.dart';
// class NewTransactionScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//           body: Center(
//         child: Text("HElloooooooo",style: TextStyle(color: Colors.white),),
//       ),
//     );
//   }
// }
import '../widgets/adaptive_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import '../providers/transactions.dart';
import '../models/account.dart';

class NewTransactionScreen extends StatefulWidget {
  @override
  _NewTransactionScreenState createState() => _NewTransactionScreenState();
}

class _NewTransactionScreenState extends State<NewTransactionScreen> {
  final titleController = TextEditingController();
  DateTime _selectedDate;
  final amountController = TextEditingController();
  final typeController = TextEditingController();

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    }); //
  }

  @override
  Widget build(BuildContext context) {
    final transactionsdata = Provider.of<Transactions>(context);
    
    void _submit() {
      transactionsdata.addTransaction(
        int.parse(amountController.text),
        typeController.text,
        titleController.text,
        _selectedDate,
      );
    }

    return Scaffold(
      body: Center(
        child: Card(
          color: Colors.grey,
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Type',
                    ),
                    textInputAction: TextInputAction.next,
                    controller: typeController,
                    onSubmitted: (_){},
                    //onChanged: (val) => titleInput=val,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) => {},
                    //onChanged: (val) => titleInput=val,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    textInputAction: TextInputAction.next,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                    onSubmitted: (_){},
                    //onChanged: (val) => amountInput = val,
                  ),
                  Container(
                    height: 70,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            _selectedDate == null
                                ? 'No Date Chosen!'
                                : 'Picked Date : ${DateFormat.yMMMMd().format(_selectedDate)}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        AdaptiveFlatButton("Choose Date", _presentDatePicker)
                      ],
                    ),
                  ),
                  RaisedButton(
                    color: Colors.red,
                    child: Text(
                      'Add Transaction',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textColor: Colors.white,
                    onPressed: _submit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
