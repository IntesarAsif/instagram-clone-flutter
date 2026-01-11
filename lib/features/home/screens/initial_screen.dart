import 'package:flutter/material.dart';
import 'package:instagram_clone/features/chat/screens/chat_screen.dart';
import 'package:instagram_clone/features/explore/screens/explore_screen.dart';
import 'package:instagram_clone/features/home/screens/home_screen.dart';
import 'package:instagram_clone/features/profile/screens/profile_screen.dart';
import 'package:instagram_clone/features/reels/screens/reels_screen.dart';
import 'package:instagram_clone/util/dimensions.dart';
import 'package:instagram_clone/util/images.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    ReelsScreen(),
    ChatScreen(),
    ExploreScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.white12, width: 0.5))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            navItem(0, const Icon(Icons.home, color: Colors.white, size: 28)),
            navItem(1, Image.asset(Images.reels, width: 24, color: Colors.white)),
            navItem(2, Image.asset(Images.navigation, width: 24, color: Colors.white)),
            navItem(3, const Icon(Icons.search, color: Colors.white, size: 30)),
            navItem(4, const CircleAvatar(radius: 14, backgroundImage: AssetImage(Images.dp4))),
          ],
        ),
      ),
    );
  }

  Widget navItem(int index, Widget icon) {
    bool isActive = currentIndex == index;

    return InkWell(
      onTap: () => setState(() => currentIndex = index),
      child: Opacity(
        opacity: isActive ? 1.0 : 0.8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: index == 4 && isActive ? BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 1)): null,
            padding: EdgeInsets.all(index == 4 ? 2 : 0),
            child: icon,
          ),
        ),
      ),
    );
  }
}
