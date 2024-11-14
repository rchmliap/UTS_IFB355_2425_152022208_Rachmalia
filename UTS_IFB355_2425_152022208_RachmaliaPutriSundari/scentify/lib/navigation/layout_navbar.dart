import 'package:flutter/material.dart';
import '../menu/home.dart';
import '../menu/type_of_perfume.dart';
import '../menu/contact_person.dart';
import '../menu/profile.dart'; // Import Profile

class LayoutNavbar extends StatefulWidget {
  const LayoutNavbar({Key? key}) : super(key: key);

  @override
  _LayoutNavbarState createState() => _LayoutNavbarState();
}

class _LayoutNavbarState extends State<LayoutNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(), // Home
    TypeOfPerfumePage(), // Type of Perfume
    ContactPersonPage(), // Contact Person // Kalkulator
    ProfilePage(), // Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_media),
            label: 'Type of Perfume',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact Person',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown,
        onTap: _onItemTapped,
      ),
    );
  }
}
