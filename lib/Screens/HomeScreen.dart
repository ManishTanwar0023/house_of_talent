
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:house_of_talent/Screens/Cmt_Login.dart';
import 'package:house_of_talent/Screens/PostPage.dart';
import 'package:house_of_talent/Screens/Profile.dart';

import 'Competition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);
  int maxCount = 5;
  bool canSwipe = true;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  final List<Widget> pages = [
  Competition(),
    Container(
      color: Colors.redAccent,
      child: Center(child: Text('Home')),
    ),
    PostPage(),
    Cmt_Login(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(pages.length, (index) => pages[index]),
      ),

      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: Colors.black54,
        showLabel: true,
        itemLabelStyle: TextStyle(color: Colors.white,fontSize: 10),
        notchColor: Colors.transparent,
        removeMargins: false,
        bottomBarWidth: MediaQuery.of(context).size.width, // Use full width
        durationInMilliSeconds: 300,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Image(image: AssetImage('assets/images/comp.png')),
            activeItem: Image(image: AssetImage('assets/images/comp.png')),
            itemLabel: 'Competition',

          ),
          BottomBarItem(
            inActiveItem: Image(image: AssetImage('assets/images/Untitled-9.png')),
            activeItem: Image(image: AssetImage('assets/images/Untitled-9.png')),
            itemLabel: 'Home',

          ),
          BottomBarItem(
            inActiveItem: Image(image: AssetImage('assets/images/Add_video.png')),
            activeItem: Image(image: AssetImage('assets/images/Add_video.png')),
            itemLabel: 'Add Video',

          ),
          BottomBarItem(
            inActiveItem: Image(image: AssetImage('assets/images/Untitled-8.png')),
            activeItem: Image(image: AssetImage('assets/images/Untitled-8.png')),
            itemLabel: 'Chat',

          ),
          BottomBarItem(
            inActiveItem: Image(image: AssetImage('assets/images/profile.png')),
            activeItem: Image(image: AssetImage('assets/images/profile.png')),
            itemLabel: 'My Profile',

          ),
        ],
        onTap: (value) {
          // Handle onTap event
          _pageController.animateToPage(
            value,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        kIconSize: 28, // Adjust icon size
        kBottomRadius: 10, // Adjust bottom radius
      ),

    );
  }
}
