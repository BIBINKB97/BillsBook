import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:money_management_project/view/add_transactions/add_transactions.dart';
import 'package:money_management_project/view/home_page/home_page.dart';
import 'package:money_management_project/view/profile_page/profile.dart';
import 'package:money_management_project/view/statitics/statitics.dart';
import 'package:money_management_project/view/transaction_list/all_transactions/transaction_list.dart';

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
        size: 28,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.compare_arrows,
        size: 36,
      ),
      label: 'Transactions',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconlyBold.plus,
        size: 30,
      ),
      label: 'Add Transaction',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconlyBold.graph,
        size: 28,
      ),
      label: 'Statitics',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconlyBold.profile,
        size: 28,
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
          selectedItemColor: Color.fromARGB(210, 151, 52, 184),
          backgroundColor: Colors.black,
          items: _bottomNavbarItems,
          onTap: (index) => setState(() => selectedIndex = index),
        ),
      ),
    );
  }
}
