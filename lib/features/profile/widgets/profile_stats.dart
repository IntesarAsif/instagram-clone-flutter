import 'package:flutter/material.dart';
import 'package:instagram_clone/util/dimensions.dart';
import 'package:instagram_clone/util/images.dart';
import 'package:instagram_clone/util/styles.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(flex: 2,
        child: Stack(children: [

          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(Images.dp4), fit: BoxFit.cover),
            ),
          ),

          Positioned(
            top: 60,
            right: 40,
            child: Container(
              decoration: BoxDecoration(color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2,
                ),
              ),
              child: Icon(Icons.add, size: 18),
            ),
          )
        ]),
      ),
      SizedBox(width: Dimensions.paddingSizeDefault),

      Expanded(
        flex: 4,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          Text("Abdur Rahman", style: robotoBold.copyWith(fontSize: Dimensions.fontSizeDefault, color: Colors.white)),
          const SizedBox(height: Dimensions.paddingSizeExtraSmall),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ProfileStatItem(count: "72", label: "posts"),
            ProfileStatItem(count: "127", label: "followers", onTap: () => print("Open Followers")),
            ProfileStatItem(count: "266", label: "following", onTap: () => print("Open Following")),
            const SizedBox(width: Dimensions.paddingSizeExtraSmall),
          ])

        ]),
      )
    ]);
  }
}


class ProfileStatItem extends StatelessWidget {
  final String count;
  final String label;
  final VoidCallback? onTap;

  const ProfileStatItem({super.key, required this.count, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(count, style: robotoBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.white)),
        Text(label, style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Colors.white)),
      ]),
    );
  }
}
