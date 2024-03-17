
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:house_of_talent/Screens/Cmt_Login.dart';
import 'package:house_of_talent/Screens/PostPage.dart';
import 'package:house_of_talent/Screens/Profile.dart';
import 'package:house_of_talent/Screens/shorts/home.dart';

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
    const Competition(),
    const ShortVideosScreen(),
    const PostPage(),
    const Cmt_Login(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(pages.length, (index) => pages[index]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedNotchBottomBar(
                      
              blurFilterX: 10,
              blurFilterY: 10,
              shadowElevation: 0,
              blurOpacity: 0,
              elevation: 5,
              notchBottomBarController: _controller,
              color: Colors.black,
              showLabel: true,
              itemLabelStyle:
                  const TextStyle(color: Colors.white, fontSize: 10),
              notchColor: const Color(0xfff4f4fc),
              removeMargins: false,
              bottomBarWidth:
                  MediaQuery.of(context).size.width, // Use full width
              durationInMilliSeconds: 300,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem:
                      Image(image: AssetImage('assets/images/comp.png')),
                  activeItem:
                      Image(image: AssetImage('assets/images/comp.png')),
                  itemLabel: 'Competition',
                ),
                BottomBarItem(
                  inActiveItem:
                      Image(image: AssetImage('assets/images/Untitled-9.png')),
                  activeItem:
                      Image(image: AssetImage('assets/images/Untitled-9.png')),
                  itemLabel: 'Home',
                ),
                BottomBarItem(
                  inActiveItem:
                      Image(image: AssetImage('assets/images/Add_video.png')),
                  activeItem:
                      Image(image: AssetImage('assets/images/Add_video.png')),
                  itemLabel: 'Add Video',
                ),
                BottomBarItem(
                  inActiveItem:
                      Image(image: AssetImage('assets/images/Untitled-8.png')),
                  activeItem:
                      Image(image: AssetImage('assets/images/Untitled-8.png')),
                  itemLabel: 'Chat',
                ),
                BottomBarItem(
                  inActiveItem:
                      Image(image: AssetImage('assets/images/profile.png')),
                  activeItem:
                      Image(image: AssetImage('assets/images/profile.png')),
                  itemLabel: 'My Profile',
                ),
              ],
              onTap: (value) {
                // Handle onTap event
                _pageController.animateToPage(
                  value,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
              kIconSize: 28, // Adjust icon size
              kBottomRadius: 10, // Adjust bottom radius
            ),
          ),



        ],
      ),

   
    );
  }
}
