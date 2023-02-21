import 'package:flutter/material.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:airpay/src/screens/profile/index.dart';
import 'package:airpay/src/screens/dashboard/index.dart';
import 'package:airpay/src/screens/transactions/index.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({ Key? key }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    const TransactionScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavyBar(
        itemCornerRadius: 30,
        onItemSelected: (index) => setState(() {
          selectedIndex = index;
        }),
        selectedIndex: selectedIndex,
        showElevation: true,
        backgroundColor: kBlueMain,
        items: [
          BottomNavyBarItem(
            inactiveColor: Colors.white,
            activeColor: Colors.white,
            icon: Icon(Icons.home),
            title: Text(
              'Home'
            ),
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.white,
            activeColor: Colors.white,
            icon: Icon(Icons.settings),
            title: Text(
              'Transaction'
            ),
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.white,
            activeColor: Colors.white,
            icon: Icon(Icons.person_outline_outlined),
            title: Text(
              'Profile'
            ),
          )
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(
            Icons.settings,
            color: Colors.black87
          )
        ),
        actions: [
          Stack(
            children: [
              Positioned(
                right: 11,
                top: 11,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 5,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pushNamed(context, 'notifications'),
                icon: const Icon(
                  Icons.notifications_rounded,
                  color: Colors.black87,
                ),
              ),
            ]
          )
        ],
      ),
    );
  }
}