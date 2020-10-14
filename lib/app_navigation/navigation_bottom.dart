import 'package:flutter/material.dart';
import 'package:flutter_networking/app_define/app_enum.dart';

class NavigationBottom extends StatelessWidget {
  NavigationBottom({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentTab.index,
      selectedItemColor: Colors.deepPurpleAccent,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(TabItem.red),
        _buildItem(TabItem.green),
        _buildItem(TabItem.blue),
      ],
      onTap: (index) => onSelectTab (
        TabItem.values[index]
      ),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    String label = tabName[tabItem];
    IconData icon = tabIcon[tabItem];
    return BottomNavigationBarItem(
        icon: Icon(icon),
        label: label
    );
  }
}