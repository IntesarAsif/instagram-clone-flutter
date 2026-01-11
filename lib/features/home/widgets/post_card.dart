import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/features/home/domain/models/post_model.dart';
import 'package:instagram_clone/util/dimensions.dart';
import 'package:instagram_clone/util/images.dart';
import 'package:instagram_clone/util/styles.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key, required this.post});

  final PostModel post;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

          Row(children: [
            Container(
              width: 27,
              height: 27,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(post.posterImage), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: Dimensions.paddingSizeSmall),

            Text(post.name, style: robotoMedium.copyWith(color: Colors.white, fontSize: 13)),
          ]),
          const Icon(Icons.more_vert, color: Colors.white),
        ]),
      ),
      const SizedBox(height: Dimensions.paddingSizeSmall),

      AspectRatio(
        aspectRatio: 1,
        child: Stack(children: [

          ClipRRect(
            child: CarouselSlider.builder(
              itemCount: post.postImages.length,
              itemBuilder: (context, index, __) {
                return Image.asset(
                  post.postImages[index],
                  fit: BoxFit.cover,
                );
              },
              options: CarouselOptions(
                viewportFraction: 1,
                height: double.infinity,
                enableInfiniteScroll: false,
                onPageChanged: (index, _) {
                  setState(() => _currentPage = index);
                },
              ),
            ),
          ),

          post.postImages.length > 1 ? Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.6), borderRadius: BorderRadius.circular(12)),
              child: Text(
                '${_currentPage + 1}/${post.postImages.length}',
                style: robotoMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeSmall),
              ),
            ),
          ) : SizedBox(),

        ]),
      ),

      PostInteractionBar(
        likes: post.likes,
        comments: post.comments,
        reposts: post.reposts,
        shares: post.shares,
      ),
    ]);
  }
}


class PostInteractionBar extends StatelessWidget {
  final String likes;
  final String comments;
  final String reposts;
  final String shares;

  const PostInteractionBar({super.key, required this.likes, required this.comments, required this.reposts, required this.shares});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.fontSizeDefault, vertical: Dimensions.fontSizeExtraSmall),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

        Row(children: [

          Row(children: [
            const Icon(Icons.favorite_border, color: Colors.white, size: 25),
            const SizedBox(width: Dimensions.paddingSizeExtraSmall),
            Text(likes, style: robotoMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeSmall)),
          ]),
          const SizedBox(width: Dimensions.paddingSizeDefault),

          Row(children: [
            Image.asset(Images.comments, height: 20),
            const SizedBox(width: Dimensions.paddingSizeExtraSmall),
            Text(comments, style: robotoMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeSmall)),
          ]),
          const SizedBox(width: Dimensions.paddingSizeDefault),

          Row(children: [
            Image.asset(Images.repost, height: 20),
            const SizedBox(width: Dimensions.paddingSizeExtraSmall),
            Text(reposts, style: robotoMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeSmall)),
          ]),
          const SizedBox(width: Dimensions.paddingSizeDefault),

          Row(children: [
            Image.asset(Images.send, height: 20),
            const SizedBox(width: Dimensions.paddingSizeExtraSmall),
            Text(shares, style: robotoMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeSmall),
            ),
          ]),
        ]),
        const Icon(Icons.bookmark_border, color: Colors.white, size: 28),
      ]),
    );
  }
}
