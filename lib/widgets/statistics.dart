import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  final String title;
  final int expense;
  final TextStyle style;
  Statistics(this.title,this.style, this.expense);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () => () {},
        splashColor: Colors.black,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 115,
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: style,
              ),
              Text(
                expense.toString(),
                style: TextStyle(color: Colors.white,fontSize: 30),
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
