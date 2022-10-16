import 'package:flutter/material.dart';

import 'package:flutter_app_1/analytics.dart';
import 'package:flutter_app_1/network.dart';

void main() => runApp(const MyApp());

final themeMode = ValueNotifier(1);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Instafit';

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value],
          debugShowCheckedModeBanner: false,
          title: _title,
          home: const MyStatefulWidget(),
        );
      },
      valueListenable: themeMode,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0; // default page
  // int _selectedIndex = 1; // default page
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> widgetOptions = <Widget>[
    Column(
      children: const <Widget>[
        Spacer(),
        OutlinedCardTop(),
        Spacer(),
        Spacer(),
        OutlinedCardBottom(),
        Spacer(),
      ],
    ),
    const CarouselWithIndicatorDemo(),
    const Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const pages = {
      0: 'Analytics',
      1: 'Network',
      2: 'Rewards',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Instafit - ${pages[_selectedIndex]}'),
        actions: [
          IconButton(
              icon: const Icon(Icons.nightlight_round),
              onPressed: () {
                themeMode.value = themeMode.value == 1 ? 2 : 1;
              }),
        ],
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.analytics_outlined),
            label: pages[0],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.people_alt_rounded),
            label: pages[1],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.monetization_on_outlined),
            label: pages[2],
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
