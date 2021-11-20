import 'package:cassava_app/screen/photo_screen.dart';
import 'package:cassava_app/screen/report_screen.dart';
import 'package:flutter/material.dart';
import "package:flutter_svg/svg.dart";

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
    final Widget homeUnselectedIcon = SvgPicture.asset(
        "assets/icons/home_outline_icon.svg",
        width: 24,
        height: 24,
        color: Theme.of(context).colorScheme.secondary);
    final Widget homeSelectedIcon = SvgPicture.asset(
      "assets/icons/home_outline_icon.svg",
      width: 24,
      height: 24,
      color: Theme.of(context).colorScheme.primary,
    );
    final Widget leafUnselectedIcon = SvgPicture.asset(
      "assets/icons/leaf_outline_icon.svg",
      width: 24,
      height: 24,
      color: Theme.of(context).colorScheme.secondary,
    );
    final Widget leafSelectedIcon = SvgPicture.asset(
      "assets/icons/leaf_outline_icon.svg",
      width: 24,
      height: 24,
      color: Theme.of(context).colorScheme.primary,
    );
    final Widget cameraUnSelectedIcon = SvgPicture.asset(
      "assets/icons/camera_outline_icon.svg",
      width: 24,
      height: 24,
      color: Theme.of(context).colorScheme.secondary,
    );
    final Widget cameraSelectedIcon = SvgPicture.asset(
      "assets/icons/camera_outline_icon.svg",
      width: 24,
      height: 24,
      color: Theme.of(context).colorScheme.primary,
    );
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: homeSelectedIcon,
            icon: homeUnselectedIcon,
            label: "Inicio",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            activeIcon: cameraSelectedIcon,
            icon: cameraUnSelectedIcon,
            label: "Diagnosticar",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            activeIcon: leafSelectedIcon,
            icon: leafUnselectedIcon,
            label: "Diagnósticos",
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
