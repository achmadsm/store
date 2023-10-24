import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/common/styles.dart';
import 'package:store/provider/page_provider.dart';
import 'package:store/ui/pages/dashboard_page.dart';
import 'package:store/ui/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _listPage = [
    const DashboardPage(),
    const ProfilePage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: DashboardPage.dashboardTitle,
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      label: ProfilePage.profileTitle,
    )
  ];

  @override
  Widget build(BuildContext context) {
    final pageRead = Provider.of<PageProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: _listPage[pageRead.bottomNavIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: kGreyColor,
        selectedItemColor: kPrimaryColor,
        currentIndex: pageRead.bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: (selected) {
          pageRead.setBottomNavIndex(selected);
        },
      ),
    );
  }
}
