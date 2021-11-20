import 'package:cassava_app/screen/photo_screen.dart';
import 'package:cassava_app/screen/report_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CustomScreen(),
    const Photo(),
    const Report(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cassava App'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        // selectedLabelStyle: Theme.of(context).textTheme.caption,
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: onTabTappend,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // activeIcon: Icon()
            icon: Icon(Icons.home),
            label: "Inicio",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: "Capture",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment_rounded),
            label: "Report",
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }

  void onTabTappend(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class CustomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: const Center(
        child: Text(
          'Text with a background color',
          // style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
