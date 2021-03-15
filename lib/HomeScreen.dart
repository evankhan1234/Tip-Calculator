import 'package:flutter/material.dart';
import 'package:tip_calculator/features/home_screen_items.dart';
import 'package:tip_calculator/palette.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final tabs = ['Home', 'Order', 'Bill', 'Settings'];

class _HomeScreenState extends State<HomeScreen> {


  List<Widget> _widgetOptions = <Widget>[
    HomeScreenItems(),
    HomeScreenItems(),
    HomeScreenItems(),
    HomeScreenItems(),
  ];

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: (Colors.purple[300])!,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Palette.primaryColor,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TabItems(
              text: tabs[0],
              icon: Icons.home,
              isSelected: _selectedIndex == 0,
              onTap: () {
                setState(() {
                  _selectedIndex == 0;
                });
              },
            ),
            TabItems(
              text: tabs[1],
              icon: Icons.shopping_cart,
              isSelected: _selectedIndex == 1,
              onTap: () {
                setState(() {
                  _selectedIndex == 1;
                });
              },
            ),
            SizedBox(width: 10),
            TabItems(
              text: tabs[2],
              icon: Icons.credit_card,
              isSelected: _selectedIndex == 2,
              onTap: () {
                setState(() {
                  _selectedIndex == 2;
                });
              },
            ),
            TabItems(
              text: tabs[3],
              icon: Icons.settings,
              isSelected: _selectedIndex == 3,
              onTap: () {
                setState(() {
                  _selectedIndex == 3;
                });
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

}

class TabItems extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const TabItems(
      {Key? key,
      required this.text,
      required this.icon,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            Text(
              text,
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
