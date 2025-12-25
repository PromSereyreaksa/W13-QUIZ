import 'package:flutter/material.dart';
import 'package:w13_quiz/ui/groceries/grocery_list.dart';
import 'package:w13_quiz/ui/groceries/tabs/grocery_search.dart';

class GroceryTabs extends StatefulWidget {
  const GroceryTabs({super.key});

  @override
  State<GroceryTabs> createState() => _GroceryTabsState();
}

enum GroceryTab { groceryTab, searchTab }

class _GroceryTabsState extends State<GroceryTabs> {
  GroceryTab _currentTab = GroceryTab.groceryTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentTab.index,
        children: [GroceryList(), GrocerySearch()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab.index,
        selectedItemColor: Colors.red,
        onTap: (index) {
          setState(() {
            _currentTab = GroceryTab.values[index];
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Groceries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_off_rounded),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
