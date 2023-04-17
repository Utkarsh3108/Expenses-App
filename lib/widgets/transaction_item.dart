import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class TransactionItem extends StatelessWidget {
  final DateTime date;
  final String title;
  final int amount;
  TransactionItem(this.date,this.amount,this.title);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () => (){},
        splashColor: Colors.black,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
                 Text(
                  DateFormat('dd/MM/yyyy').format(date),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
             
            
                 Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              
           
                Text(
                  "₹$amount",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}