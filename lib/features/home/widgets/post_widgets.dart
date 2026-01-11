import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/features/home/controllers/home_controller.dart';
import 'package:instagram_clone/features/home/domain/models/post_model.dart';
import 'package:instagram_clone/features/home/widgets/post_card.dart';
import 'package:instagram_clone/util/dimensions.dart';
import 'package:instagram_clone/util/styles.dart';

class PostWidgets extends StatefulWidget {
  const PostWidgets({super.key});

  @override
  State<PostWidgets> createState() => _PostWidgetsState();
}

class _PostWidgetsState extends State<PostWidgets> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.posts.length,
          separatorBuilder: (_, _) => const SizedBox(height: Dimensions.paddingSizeDefault), // Changed from width to height
          itemBuilder: (context, index) {
            final post = controller.posts[index];
            return PostCard(post: post);
          },
        );
      },
    );
  }
}

