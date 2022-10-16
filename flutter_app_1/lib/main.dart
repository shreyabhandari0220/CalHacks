import 'package:flutter/material.dart';

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

/*
  Outlined Card
*/
/// An example of the outlined card type.
///
/// To make a [Card] match the outlined type, the default elevation and shape
/// need to be changed to the values from the spec:
///
/// https://m3.material.io/components/cards/specs#0f55bf62-edf2-4619-b00d-b9ed462f2c5a
class OutlinedCardTop extends StatelessWidget {
  const OutlinedCardTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: const SizedBox(
          width: 300,
          height: 100,
          // \n == newline
          // \u2022 == bullet
          child: Center(
              child: Text(
'Risk:\n\u2022 60% Heart Disease\n\u2022 40% Blood Pressure\n\u2022 20% Blood Glucose')),
        ),
      ),
    );
  }
}

class OutlinedCardBottom extends StatelessWidget {
  const OutlinedCardBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(children: <Widget>[
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Spacer(),
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(child: Text('Blood Pressure')),
                ),
                const Spacer(),
                const Spacer(),
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: Image(image: AssetImage('images/status/9.jpg')),
                ),
                const Spacer(),
              ],
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Spacer(),
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(child: Text('LDL')),
                ),
                const Spacer(),
                const Spacer(),
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: Image(image: AssetImage('images/status/7.jpg')),
                ),
                const Spacer(),
              ],
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Spacer(),
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(child: Text('HDL')),
                ),
                const Spacer(),
                const Spacer(),
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: Image(image: AssetImage('images/status/12.jpg')),
                ),
                const Spacer(),
              ],
            ),
          ])),
    );
  }
}
