import 'package:flutter/material.dart';

enum TabItem { red, green, blue }

Map<TabItem, String> tabName = {
  TabItem.red: 'red',
  TabItem.green: 'green',
  TabItem.blue: 'blue'
};

Map<TabItem, IconData> tabIcon = {
  TabItem.red: Icons.architecture_sharp,
  TabItem.green: Icons.archive,
  TabItem.blue: Icons.layers,
};