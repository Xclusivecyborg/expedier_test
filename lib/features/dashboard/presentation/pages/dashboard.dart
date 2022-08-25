import 'package:expedier_test/core/utils/helpers.dart';
import 'package:expedier_test/features/dashboard/presentation/widgets/app_fab.dart';
import 'package:expedier_test/features/dashboard/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ExpNavbar extends StatefulWidget {
  const ExpNavbar({Key? key}) : super(key: key);

  @override
  State<ExpNavbar> createState() => _ExpNavbarState();
}

class _ExpNavbarState extends State<ExpNavbar> {
  int currentTab = 0;

  final List<BarItem> barItems = [
    BarItem(
      text: "Home",
      icon: 'assets/icons/home.svg',
      selectedicon: 'assets/icons/home.svg',
    ),
    BarItem(
      text: "Account",
      icon: 'assets/icons/account.svg',
      selectedicon: 'assets/images/account.svg',
    ),
    BarItem(text: "Send", icon: '', selectedicon: ''),
    BarItem(
      text: "Recipients",
      icon: 'assets/icons/recip.svg',
      selectedicon: 'assets/icons/recip.svg',
    ),
    BarItem(
      text: "Bills",
      icon: 'assets/icons/bills.svg',
      selectedicon: 'assets/icons/bills.svg',
    ),
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: SizedBox(
        width: Helpers.width(context),
        height: Helpers.height(context),
        child: Stack(
          children:const <Widget>[
            // child,
          ],
        ),
      ),
      floatingActionButton: const AppFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
        child: AnimatedBottomBar(
            barItems: barItems,
            tabIndex: currentTab,
            onBarTap: (index) {
              setState(() {
                currentTab = index;
                // tabsRouter.setActiveIndex(index);
              });
            }),
      ),
    );
  }
}
