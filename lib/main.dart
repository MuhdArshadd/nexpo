import 'package:flutter/material.dart';
import 'package:tourism_app/view/calendar_main.dart';
import 'package:tourism_app/view/review_main.dart';
import 'view/home_page.dart';
import 'view/attraction_page.dart';
//import 'restaurant_page.dart'; // Assume you have a RestaurantPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEXPO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  bool _isLoggedIn = false;

  static late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomePage(isLoggedIn: _isLoggedIn, onLoginChanged: _handleLoginChanged),
      AttractionPage(isLoggedIn: _isLoggedIn, onLoginChanged: _handleLoginChanged),
      ReviewMainPage(isLoggedIn: _isLoggedIn, onLoginChanged: _handleLoginChanged),
      CalendarMainPage(isLoggedIn: _isLoggedIn, onLoginChanged: _handleLoginChanged),
      // RestaurantPage(isLoggedIn: _isLoggedIn, onLoginChanged: _handleLoginChanged), // Add the RestaurantPage when ready
    ];
  }

  void _handleLoginChanged(bool isLoggedIn) {
    setState(() {
      _isLoggedIn = isLoggedIn;
      _widgetOptions = <Widget>[
        HomePage(isLoggedIn: _isLoggedIn, onLoginChanged: _handleLoginChanged),
        AttractionPage(isLoggedIn: _isLoggedIn, onLoginChanged: _handleLoginChanged),
        ReviewMainPage(isLoggedIn: _isLoggedIn, onLoginChanged: _handleLoginChanged),
        CalendarMainPage(isLoggedIn: _isLoggedIn, onLoginChanged: _handleLoginChanged),
      ];
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Attractions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Events',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
