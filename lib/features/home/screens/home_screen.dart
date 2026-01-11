import 'package:flutter/material.dart';
import 'package:instagram_clone/common/widgets/custom_app_bar.dart';
import 'package:instagram_clone/features/home/widgets/post_widgets.dart';
import 'package:instagram_clone/features/home/widgets/story_widgets.dart';
import 'package:instagram_clone/util/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        backgroundColor: Colors.black,
        leading: const Icon(Icons.add, color: Colors.white, size: 30,),
        title: Image.asset(Images.instagramText, height: 35,),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.favorite_border, color: Colors.white, size: 25,),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            StoryWidgets(),
            PostWidgets(),
          ]),
        ),
      )
    );
  }
}
