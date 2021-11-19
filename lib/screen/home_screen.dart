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
        currentIndex: _currentIndex,
        onTap: onTabTappend,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo), label: "CAPTURE"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment_rounded), label: "REPORT"),
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
      color: Colors.green.shade300,
      child: const Center(
        child: Text('Pagina de Inicio'),
      ),
    );
  }
}
