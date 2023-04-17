import 'package:flutter/material.dart';
import '../widgets/all_accounts.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Column(
          children: <Widget>[
            AllAccounts(),
          ],
        ),
      
    );
  }
}
