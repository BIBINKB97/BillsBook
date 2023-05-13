import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:money_management_project/screens/add_transactions/add_transactions.dart';
import 'package:money_management_project/screens/home_page/home_page.dart';
import 'package:money_management_project/screens/profile_page/profile.dart';
import 'package:money_management_project/screens/statitics/statitics.dart';
import 'package:money_management_project/screens/transaction_list/all_transactions/transaction_list.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  final screens = [
    HomePage(),
    TransactionList(),
    AddTransaction(),
    FinancialReport(),
    Profile(),
  ];
  final List<BottomNavigationBarItem> _bottomNavbarItems = [
    BottomNavigationBarItem(
      icon: Icon(
        IconlyBold.home,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.compare_arrows,
        size: 40,
      ),
      label: 'Transactions',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconlyBold.plus,
        size: 35,
      ),
      label: 'Add Transaction',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconlyBold.graph,
      ),
      label: 'Statitics',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconlyBold.profile,
      ),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          unselectedItemColor: Colors.grey,
          elevation: 0,
          iconSize: 32,
          selectedItemColor: Color.fromARGB(210, 151, 52, 184),
          backgroundColor: Colors.black,
          items: _bottomNavbarItems,
          onTap: (index) => setState(() => selectedIndex = index),
        ),
      ),
    );
  }
}
