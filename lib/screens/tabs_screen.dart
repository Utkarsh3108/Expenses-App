import 'package:flutter/material.dart';

import '../screens/dashboard_screen.dart';
import '../screens/new_transaction_screen.dart';
import '../screens/transaction_list.dart';
import '../providers/accounts.dart';
import 'package:provider/provider.dart';
import '../providers/transactions.dart';
import './statistics_screen.dart';
import 'more_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': DashboardScreen(),
        'title': 'Dashboard',
      },
      {
        'page': TransactionList(),
        // 'page': FavouritesScreen(widget.favouriteMeals),
        'title': 'History',
      },
      {
        'page': NewTransactionScreen(),
        // 'page': FavouritesScreen(widget.favouriteMeals),
        'title': 'Transaction',
      },
      {
        'page': StatisticsScreen(),
        // 'page': FavouritesScreen(widget.favouriteMeals),
        'title': 'Statistics',
      },
      {
        'page': MoreScreen(),
        // 'page': FavouritesScreen(widget.favouriteMeals),
        'title': 'More',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Accounts(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Transactions(),
        ),
      ],
      child: Scaffold(
        
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white30,
              border:
                  Border(top: BorderSide(color: Colors.white, width: 0.15))),
          child: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.tealAccent,
            currentIndex: _selectedPageIndex,
            type: BottomNavigationBarType.fixed,
            //type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.account_balance_wallet),
                title: Text('Dashboard'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.access_time_rounded),
                title: Text('History'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.add_circle_rounded),
                title: Text('Transaction'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.bar_chart),
                title: Text('Statistics'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.more_horiz_rounded),
                title: Text('More'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
